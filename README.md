# Artsdata Data Model

This is the Artsdata.ca Data Model project repository. It contains all the schemas, examples and software used to publish the Artsdata.ca Data Model Documentation. For the site itself, please see [artsdata.ca](http://artsdata.ca) instead.

Issues and proposals are managed with GitHub issues.

Most of the documentation is generated using the vocabulary from the original ontology (rdfs:label, rdfs:comment).

Examples are manually edited in the doc folder of this repository using Markdown.

To do: Add SHACL shapes for each class.

To do: Add ShEx shapes for mapping to Wikidata.

To generate documentation:

    % cd _generators
    % ruby generate.rb


## Test on local machine
1. `bundle install`
2. `source .github-token`
2. `bundle exec jekyll serve` or manually set the token `JEKYLL_GITHUB_TOKEN=123 jekyll serve`

more info: http://jekyll.github.io/github-metadata/authentication/

## Formatting Controlled Vocabulary Turtle Files
The controlled vocabularies and ontologies are writting using turtle syntax. The turtle is often created in a Google Sheet and then copy/pasted into a file with extenion `.ttl`. For example `skos-event-types.ttl`. 

All turtle files should be automatically formatted using bjdmeest.ttlformatter plugin in Visual Studio Code before being committed. This helps see changes between versions and keeps a standardized layout.

## Public documentation pages

The Artsdata data model contains several public documentation pages intended for broad dissemination. They are created as markdown file (`.md`) and published as html documents. There are severa different sets of public pages, each one with a specific focus:

| Collection | Location | Includes |
| -  | - | - |
| Landing page, named `index` | Root | |
| Architecture | _architecture | Documents describing how data flows in and out of Artsdata |
| Classes | _classes | All top-level classes included in the data model |
| Controlled vocabularies | Root | event-types |
| Properties | Root | - location<br> - performer <br> - sameas |
| Identifiers guidelines | Root | - identifier-recommendations<br>  - id<br>  - sameas<br>  - retrieve-uri |
| Structured data templates | _gabarits-jsonld | - README (Event)<br> - Organization<br> - Person |

### Translations

The naming convention for language versions of the same documentation page is :

- English: No language subtag in the URL slug. Example: `index.md`.
- Français: `.fr` language subtag inserted before the file extension. Example: `index.fr.md`.

---

## Contributing

### Requirements

- A [GitHub account](https://github.com/join)
- Write access to this repository

### Creating a new page

1. Navigate to the correct collection folder (`_architecture/`, `_classes/`, or `_gabarits-jsonld/`)
2. Click **Add file → Create new file**
3. Name the file using lowercase letters and dashes (e.g. `my-new-topic.md`)
4. Add the appropriate front matter at the top of the file:

**`_architecture/` pages:**
```
---
title: Your Page Title
layout: architecture-doc
---
```

**`_classes/` pages:**
```
---
class_name: ClassName
layout: class-event-doc
---
```

**`_gabarits-jsonld/` pages:**
```
---
title: Your Template Title
layout: gabarits-doc
---
```

5. Write the page content in Markdown after the closing `---`
6. Scroll to the bottom, select **Create a new branch and start a pull request**, and submit the PR

### French version

Create a corresponding `.fr.md` file (e.g. `my-page.fr.md`) with `nav_exclude: true` and a `title` field added to the front matter. The EN/FR toggle links the two files automatically based on their shared filename — no additional configuration required.

**Example French front matter for `_architecture/` pages:**
```
---
title: Titre de la page
layout: architecture-doc
nav_exclude: true
---
```

### File naming rules

| Rule | Example |
|---|---|
| Lowercase only | `my-page.md` not `MyPage.md` |
| Dashes between words | `data-consumers.md` not `data_consumers.md` |
| French version adds `.fr` | `overview.fr.md` |

### Editing an existing page

1. Open the file in the repository and click the **pencil icon** (✏️)
2. Make your changes and select **Create a new branch and start a pull request**
3. Apply the same changes to the corresponding `.fr.md` file in the same branch

### Questions and issues

Open an [issue on GitHub](https://github.com/culturecreates/artsdata-data-model/issues).
