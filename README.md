## Artsdata Data Model

This is the Artsdata.ca Data Model project repository. It contains all the schemas, examples and software used to publish the Artsdata.ca Data Model Documentation. For the site itself, please see [artsdata.ca](http://artsdata.ca) instead.

Issues and proposals are managed with GitHub issues.

Most of the documentation is generated using the vocabulary from the original ontology (rdfs:label, rdfs:comment).

Examples are manually edited in the doc folder of this repository usign Markdown.

To do: Add SHACL shapes for each class.

To do: Add ShEx shapes for mapping to Wikidata.

To generate documentation:

    % cd _generators
    % ruby generate.rb

