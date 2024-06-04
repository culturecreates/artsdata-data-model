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


## Event Specific Instructions
The file [Event-specific-instructions.json](/_data/Event-specific-instructions.json) is generated from this [spreadsheet](https://docs.google.com/spreadsheets/d/1zGMVtrMO6Ja82jblir2AUjzSYAciCXBwoNzi-pomGok/edit#gid=0)
using an online CSV to JSON tool called [convertcsv](https://www.convertcsv.com/csv-to-json.html).


## Test on local machine
1. `bundle install`
2. `JEKYLL_GITHUB_TOKEN=123 jekyll serve`

more info: http://jekyll.github.io/github-metadata/authentication/