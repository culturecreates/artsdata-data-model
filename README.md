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
2. `source .github-token`
2. `bundle exec jekyll serve` or manually set the token `JEKYLL_GITHUB_TOKEN=123 jekyll serve`

more info: http://jekyll.github.io/github-metadata/authentication/

## Formatting Controlled Vocabulary Turtle Files
The controlled vocabularies and ontologies are writting using turtle syntax. The turtle is often created in a Google Sheet and then copy/pasted into a file with extenion `.ttl`. For example `skos-event-types.ttl`. 

All turtle files should be automatically formatted using bjdmeest.ttlformatter plugin in Visual Studio Code before being committed. This helps see changes between versions and keeps a standardized layout.