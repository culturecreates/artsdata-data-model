## Artsdata Data Model v{{ site.data.versions.schemaVersion }}

This is the Artsdata.ca Data Model project repository. It contains all the schemas, examples and software used to publish the Artsdata.ca Data Model Documentation. For the site itself, please see [artsdata.ca](http://artsdata.ca) instead.

Issues and proposals are managed with GitHub issues.

Most of the documentation is generated. 

To generate documentation:

    % cd _generators
    % ruby generate.rb


### Classes

<ol>
{% for class in site.classes %}
<li>
    <a href="{{ class.url }}">
        {{ class.class_name }}
    </a>
</li>
{% endfor %}
</ol>
