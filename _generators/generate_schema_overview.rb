# Generates schema-overview/index.html, an interactive static webpage
# listing every class and property in the Artsdata data model, from
# artsdata-schema.ttl alone (see generate_mcp_schema.rb, which produces
# that file).
#
# Usage (from _generators, after `bundle install`):
#   bundle exec ruby generate_schema_overview.rb
#
# Run automatically at the end of generate_mcp_schema.rb, so the two files
# always regenerate together.

require 'rdf'
require 'rdf/turtle'
require 'json'

SH = RDF::Vocabulary.new('http://www.w3.org/ns/shacl#')

module SchemaOverview
  SCHEMA_FILE = File.expand_path('../artsdata-schema.ttl', __dir__)
  OUTPUT_DIR  = File.expand_path('../schema-overview', __dir__)
  OUTPUT_FILE = File.join(OUTPUT_DIR, 'index.html')

  module_function

  def run
    graph, prefixes = load_graph(SCHEMA_FILE)
    classes = extract_classes(graph, prefixes)
    File.write(OUTPUT_FILE, render(classes))
    puts "Generated #{OUTPUT_FILE.sub("#{File.expand_path('..', __dir__)}/", '')} (#{classes.size} classes)."
  end

  def load_graph(path)
    reader = RDF::Turtle::Reader.new(File.read(path))
    graph = RDF::Graph.new
    reader.each_statement { |statement| graph << statement }
    [graph, reader.prefixes.transform_values(&:to_s)]
  end

  # ---- URI compaction ----

  def compact(term, prefixes)
    return nil if term.nil?
    return term.to_s unless term.uri?

    uri = term.to_s
    prefix, namespace = prefixes.max_by { |_, ns| uri.start_with?(ns) ? ns.length : -1 }
    return uri unless namespace && uri.start_with?(namespace) && namespace.length.positive?

    "#{prefix}:#{uri[namespace.length..]}"
  end

  # ---- Small graph-query helpers ----

  def objects(graph, subject, predicate)
    graph.query([subject, predicate, nil]).map(&:object)
  end

  def first_object(graph, subject, predicate)
    objects(graph, subject, predicate).first
  end

  def first_literal(graph, subject, predicate)
    first_object(graph, subject, predicate)&.to_s
  end

  def literals(graph, subject, predicate)
    objects(graph, subject, predicate).select(&:literal?).map do |literal|
      { 'value' => literal.to_s, 'lang' => literal.language&.to_s }
    end
  end

  def rdf_list(graph, subject, predicate)
    head = first_object(graph, subject, predicate)
    return [] unless head

    RDF::List.new(subject: head, graph: graph).to_a
  end

  # ---- Self-targeting shapes (sh:targetObjectsOf) ----
  #
  # e.g. ads:GenreConceptShape, ads:OrganizationTypeConceptShape,
  # ads:CoreDescriptionShape -- these validate the VALUE of a property
  # (skos:inScheme membership, owl:deprecated, a SPARQL check on
  # schema:description, etc.), not a class. Collected once, then attached
  # as extra notes to any property row whose sh:path matches.
  def extract_value_constraints(graph, node_shapes, prefixes)
    notes_by_predicate = Hash.new { |h, k| h[k] = [] }

    node_shapes.each do |shape|
      predicates = objects(graph, shape, SH.targetObjectsOf)
      next if predicates.empty?

      notes = []

      objects(graph, shape, SH.property).each do |prop_shape|
        path = compact(first_object(graph, prop_shape, SH.path), prefixes)
        message = first_literal(graph, prop_shape, SH.message)
        severity = compact(first_object(graph, prop_shape, SH.severity), prefixes)

        if path == 'skos:inScheme'
          value = compact(first_object(graph, prop_shape, SH.hasValue), prefixes)
          notes << "Must be skos:inScheme #{value}" if value
        elsif message
          notes << [severity, message].compact.join(': ')
        end
      end

      objects(graph, shape, SH.sparql).each do |sparql_shape|
        message = first_literal(graph, sparql_shape, SH.message)
        notes << "SPARQL check: #{message}" if message
      end

      predicates.each { |predicate| notes_by_predicate[predicate].concat(notes) }
    end

    notes_by_predicate
  end

  # ---- Property shapes ----

  def extract_property(graph, prefixes, node, value_constraints)
    path = first_object(graph, node, SH.path)
    min_count = first_literal(graph, node, SH.minCount)
    max_count = first_literal(graph, node, SH.maxCount)
    node_ref = first_object(graph, node, SH.node)

    {
      'path' => compact(path, prefixes),
      'pathUri' => path&.to_s,
      'name' => first_literal(graph, node, SH.name),
      'cardinality' => "#{min_count || '0'}..#{max_count || '*'}",
      'datatype' => compact(first_object(graph, node, SH.datatype), prefixes),
      'class' => compact(first_object(graph, node, SH.class), prefixes),
      'nodeKind' => compact(first_object(graph, node, SH.nodeKind), prefixes),
      'inValues' => rdf_list(graph, node, SH.in).map { |v| compact(v, prefixes) },
      'pattern' => first_literal(graph, node, SH.pattern),
      'hasValue' => compact(first_object(graph, node, SH.hasValue), prefixes),
      'uniqueLang' => first_literal(graph, node, SH.uniqueLang),
      'languageIn' => rdf_list(graph, node, SH.languageIn).map(&:to_s),
      'severity' => compact(first_object(graph, node, SH.severity), prefixes),
      'message' => first_literal(graph, node, SH.message),
      'nodeRef' => node_ref && extract_node_shape(graph, prefixes, node_ref, value_constraints),
      'or' => rdf_list(graph, node, SH.or).map { |alt| extract_property(graph, prefixes, alt, value_constraints) },
      'ontology' => ontology_info(graph, path),
      'notes' => path ? value_constraints[path] : []
    }.compact
  end

  # A shape referenced only via sh:node (no sh:targetClass of its own),
  # e.g. ads:CoreImageShape, ads:CorePostalAddressShape.
  def extract_node_shape(graph, prefixes, shape, value_constraints)
    {
      'name' => compact(shape, prefixes),
      'properties' => objects(graph, shape, SH.property).map { |p| extract_property(graph, prefixes, p, value_constraints) }
    }
  end

  def ontology_info(graph, path)
    return nil unless path

    label = literals(graph, path, RDF::RDFS.label)
    comment = literals(graph, path, RDF::RDFS.comment)
    domain = objects(graph, path, RDF::RDFS.domain)
    range = objects(graph, path, RDF::RDFS.range)
    sub_property_of = objects(graph, path, RDF::RDFS.subPropertyOf)
    equivalent_property = objects(graph, path, RDF::OWL.equivalentProperty)

    return nil if [label, comment, domain, range, sub_property_of, equivalent_property].all?(&:empty?)

    {
      'label' => label,
      'comment' => comment,
      'domain' => domain.map(&:to_s),
      'range' => range.map(&:to_s),
      'subPropertyOf' => sub_property_of.map(&:to_s),
      'equivalentProperty' => equivalent_property.map(&:to_s)
    }.compact
  end

  # ---- Classes ----

  def extract_classes(graph, prefixes)
    node_shapes = graph.query([nil, RDF.type, SH.NodeShape]).map(&:subject).uniq
    value_constraints = extract_value_constraints(graph, node_shapes, prefixes)

    shapes_by_class = Hash.new { |h, k| h[k] = [] }
    node_shapes.each do |shape|
      objects(graph, shape, SH.targetClass).each { |cls| shapes_by_class[cls] << shape }
    end

    ontology_classes = graph.query([nil, RDF.type, RDF::RDFS.Class]).map(&:subject).uniq
    class_uris = (shapes_by_class.keys + ontology_classes).uniq

    class_uris.map do |cls|
      shapes = shapes_by_class[cls] || []
      properties = shapes.flat_map do |shape|
        objects(graph, shape, SH.property).map do |p|
          extract_property(graph, prefixes, p, value_constraints).merge('shape' => compact(shape, prefixes))
        end
      end

      {
        'uri' => cls.to_s,
        'compact' => compact(cls, prefixes),
        'label' => literals(graph, cls, RDF::RDFS.label),
        'comment' => literals(graph, cls, RDF::RDFS.comment),
        'subClassOf' => objects(graph, cls, RDF::RDFS.subClassOf).map { |c| compact(c, prefixes) },
        'equivalentClass' => objects(graph, cls, RDF::OWL.equivalentClass).map { |c| compact(c, prefixes) },
        'shapes' => shapes.map { |s| compact(s, prefixes) },
        'properties' => properties
      }
    end.sort_by { |c| c['label'].first&.fetch('value', nil) || c['compact'] }
  end

  # ---- Rendering ----

  def render(classes)
    data = JSON.generate(classes).gsub('</', '<\\/')
    <<~HTML
      <!doctype html>
      <html lang="en">
      <head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <title>Artsdata Schema Overview</title>
      <!-- GENERATED FILE -- do not edit directly.
           Generated by _generators/generate_schema_overview.rb from artsdata-schema.ttl. -->
      #{style}
      </head>
      <body>
      <header>
        <h1>Artsdata Schema Overview</h1>
        <p>Every class and property in the <a href="../artsdata-schema.ttl">Artsdata CORE graph data model</a>, extracted from its ontology and SHACL shapes. Click a class to expand it.</p>
        <div class="controls">
          <input id="search" type="search" placeholder="Filter classes and properties...">
          <button id="expand-all" type="button">Expand all</button>
          <button id="collapse-all" type="button">Collapse all</button>
        </div>
      </header>
      <main id="classes"></main>
      {% raw %}
      <script type="application/json" id="schema-data">#{data}</script>
      #{script}
      {% endraw %}
      </body>
      </html>
    HTML
  end

  def style
    <<~CSS
      <style>
        :root {
          color-scheme: light dark;
          --bg: #ffffff; --fg: #1a1a1a; --muted: #5b6470; --border: #d8dee4;
          --card: #f6f8fa; --accent: #2f5fda; --mono: ui-monospace, SFMono-Regular, Menlo, Consolas, monospace;
          --warn: #8a5a00; --warn-bg: #fff3d6;
        }
        @media (prefers-color-scheme: dark) {
          :root { --bg: #0f1115; --fg: #e6e8eb; --muted: #98a2ae; --border: #2b3138; --card: #171a20; --accent: #7fa2ff; --warn: #f0b840; --warn-bg: #3a2e0a; }
        }
        * { box-sizing: border-box; }
        body { margin: 0; background: var(--bg); color: var(--fg); font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Helvetica, Arial, sans-serif; line-height: 1.5; }
        header { padding: 2rem 1.5rem 1rem; max-width: 1000px; margin: 0 auto; }
        h1 { margin: 0 0 .5rem; font-size: 1.6rem; }
        header p { color: var(--muted); margin: 0 0 1rem; }
        header p a { color: var(--accent); }
        .controls { display: flex; gap: .5rem; flex-wrap: wrap; }
        #search { flex: 1; min-width: 200px; padding: .5rem .75rem; border: 1px solid var(--border); border-radius: 6px; background: var(--bg); color: var(--fg); font-size: .95rem; }
        button { padding: .5rem .75rem; border: 1px solid var(--border); border-radius: 6px; background: var(--card); color: var(--fg); cursor: pointer; font-size: .85rem; }
        button:hover { border-color: var(--accent); }
        main { max-width: 1000px; margin: 0 auto; padding: 0 1.5rem 3rem; }
        .class-card { border: 1px solid var(--border); border-radius: 8px; margin-bottom: .75rem; overflow: hidden; }
        .class-card[hidden] { display: none; }
        .class-header { width: 100%; text-align: left; background: var(--card); border: none; color: var(--fg); padding: .9rem 1rem; display: flex; align-items: center; gap: .6rem; cursor: pointer; border-radius: 0; }
        .class-header .chevron { transition: transform .15s ease; color: var(--muted); }
        .class-card.open .class-header .chevron { transform: rotate(90deg); }
        .class-header .name { font-weight: 600; font-family: var(--mono); font-size: 1rem; }
        .class-header .count { color: var(--muted); font-size: .85rem; margin-left: auto; }
        .class-body { padding: 1rem; display: none; }
        .class-card.open .class-body { display: block; }
        .class-meta { color: var(--muted); font-size: .9rem; margin-bottom: 1rem; }
        .class-meta code { font-family: var(--mono); }
        .badge-row { margin-top: .4rem; display: flex; flex-wrap: wrap; gap: .35rem; }
        .badge { display: inline-block; padding: .1rem .5rem; border: 1px solid var(--border); border-radius: 999px; font-size: .78rem; font-family: var(--mono); color: var(--muted); }
        table { width: 100%; border-collapse: collapse; font-size: .88rem; }
        th, td { text-align: left; padding: .5rem .6rem; border-bottom: 1px solid var(--border); vertical-align: top; }
        th { color: var(--muted); font-weight: 600; font-size: .78rem; text-transform: uppercase; letter-spacing: .03em; }
        td.prop-name { font-family: var(--mono); white-space: nowrap; }
        td.prop-name a { color: var(--fg); text-decoration: none; }
        td.prop-name a:hover { text-decoration: underline; }
        .prop-label { display: block; color: var(--muted); font-family: -apple-system, sans-serif; font-size: .8rem; }
        .constraint-list { margin: 0; padding-left: 1.1rem; }
        .constraint-list li { margin-bottom: .2rem; }
        .warning-note { color: var(--warn); background: var(--warn-bg); padding: .1rem .4rem; border-radius: 4px; display: inline-block; }
        .nested { margin-top: .4rem; padding: .5rem .6rem; border-left: 2px solid var(--border); font-size: .85rem; }
        .nested-title { font-family: var(--mono); color: var(--muted); margin-bottom: .3rem; }
        .empty { color: var(--muted); font-style: italic; padding: .5rem 0; }
        code { font-family: var(--mono); }
      </style>
    CSS
  end

  def script
    <<~JS
      <script>
      (function () {
        var classes = JSON.parse(document.getElementById('schema-data').textContent);
        var main = document.getElementById('classes');

        function esc(s) {
          return String(s == null ? '' : s).replace(/[&<>"]/g, function (c) {
            return { '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;' }[c];
          });
        }

        function link(compactName, uri) {
          if (!compactName) return '';
          return uri ? '<a href="' + esc(uri) + '" target="_blank" rel="noopener">' + esc(compactName) + '</a>' : esc(compactName);
        }

        function localizedText(items) {
          if (!items || !items.length) return '';
          var en = items.find(function (i) { return i.lang === 'en'; }) || items[0];
          return esc(en.value);
        }

        function typeCell(p) {
          if (p.inValues && p.inValues.length) return 'one of: ' + p.inValues.map(esc).join(', ');
          if (p.class) return esc(p.class);
          if (p.datatype) return esc(p.datatype);
          if (p.hasValue) return esc(p.hasValue);
          if (p.nodeKind) return esc(p.nodeKind.replace(/^sh:/, ''));
          if (p.or && p.or.length) return p.or.map(typeCell).filter(Boolean).join(' or ');
          return '&mdash;';
        }

        function constraintCell(p) {
          var items = [];
          if (p.pattern) items.push('pattern <code>' + esc(p.pattern) + '</code>');
          if (p.uniqueLang === 'true') items.push('unique language per value');
          if (p.languageIn && p.languageIn.length) items.push('language in ' + p.languageIn.map(esc).join(', '));
          if (p.severity === 'sh:Warning') items.push('<span class="warning-note">Warning only</span>');
          if (p.message) items.push(esc(p.message));
          (p.notes || []).forEach(function (n) { items.push(esc(n)); });
          if (p.nodeRef) {
            items.push('<div class="nested"><div class="nested-title">' + link(p.nodeRef.name) + ' fields</div>' +
              p.nodeRef.properties.map(function (np) {
                return esc(np.name || np.path) + ' (' + esc(np.cardinality) + ')';
              }).join(', ') + '</div>');
          }
          if (!items.length) return '&mdash;';
          return '<ul class="constraint-list"><li>' + items.join('</li><li>') + '</li></ul>';
        }

        function definitionCell(p) {
          var parts = [];
          if (p.ontology && p.ontology.comment && p.ontology.comment.length) {
            parts.push(localizedText(p.ontology.comment));
          }
          if (p.ontology && p.ontology.equivalentProperty && p.ontology.equivalentProperty.length) {
            parts.push('<span class="prop-label">equivalent to ' + p.ontology.equivalentProperty.map(function (u) { return esc(u); }).join(', ') + '</span>');
          }
          return parts.length ? parts.join('<br>') : '&mdash;';
        }

        function propertyRow(p) {
          var label = p.name || (p.ontology && p.ontology.label && localizedText(p.ontology.label));
          var subtitle = [label, p.shape ? 'via ' + p.shape : null].filter(Boolean).join(' · ');
          return '<tr>' +
            '<td class="prop-name">' + link(p.path, p.pathUri) + (subtitle ? '<span class="prop-label">' + esc(subtitle) + '</span>' : '') + '</td>' +
            '<td>' + esc(p.cardinality) + '</td>' +
            '<td>' + typeCell(p) + '</td>' +
            '<td>' + constraintCell(p) + '</td>' +
            '<td>' + definitionCell(p) + '</td>' +
            '</tr>';
        }

        function classCard(cls) {
          var card = document.createElement('div');
          card.className = 'class-card';
          card.dataset.searchText = (cls.compact + ' ' + (cls.label || []).map(function (l) { return l.value; }).join(' ') + ' ' +
            cls.properties.map(function (p) { return p.path + ' ' + (p.name || ''); }).join(' ')).toLowerCase();

          var meta = [];
          if (cls.subClassOf && cls.subClassOf.length) meta.push('subclass of ' + cls.subClassOf.map(esc).join(', '));
          if (cls.equivalentClass && cls.equivalentClass.length) meta.push('equivalent to ' + cls.equivalentClass.map(esc).join(', '));
          if (cls.shapes && cls.shapes.length) meta.push('shapes: ' + cls.shapes.map(esc).join(', '));

          var rows = cls.properties.length
            ? cls.properties.map(propertyRow).join('')
            : '';

          card.innerHTML =
            '<button type="button" class="class-header">' +
              '<span class="chevron">&#9656;</span>' +
              '<span class="name">' + link(cls.compact, cls.uri) + '</span>' +
              '<span class="count">' + cls.properties.length + ' propert' + (cls.properties.length === 1 ? 'y' : 'ies') + '</span>' +
            '</button>' +
            '<div class="class-body">' +
              (cls.comment && cls.comment.length ? '<p class="class-meta">' + localizedText(cls.comment) + '</p>' : '') +
              (meta.length ? '<p class="class-meta">' + meta.join(' &middot; ') + '</p>' : '') +
              (rows
                ? '<table><thead><tr><th>Property</th><th>Cardinality</th><th>Type / Range</th><th>Constraints</th><th>Definition</th></tr></thead><tbody>' + rows + '</tbody></table>'
                : '<p class="empty">No properties shaped for this class.</p>') +
            '</div>';

          card.querySelector('.class-header').addEventListener('click', function () {
            card.classList.toggle('open');
          });

          return card;
        }

        classes.forEach(function (cls) { main.appendChild(classCard(cls)); });

        document.getElementById('search').addEventListener('input', function (e) {
          var q = e.target.value.trim().toLowerCase();
          document.querySelectorAll('.class-card').forEach(function (card) {
            var match = !q || card.dataset.searchText.indexOf(q) !== -1;
            card.hidden = !match;
            if (match && q) card.classList.add('open');
          });
        });

        document.getElementById('expand-all').addEventListener('click', function () {
          document.querySelectorAll('.class-card').forEach(function (c) { c.classList.add('open'); });
        });
        document.getElementById('collapse-all').addEventListener('click', function () {
          document.querySelectorAll('.class-card').forEach(function (c) { c.classList.remove('open'); });
        });
      })();
      </script>
    JS
  end
end

SchemaOverview.run
