{% include last-modified.html %}
 
Naming Conventions
===================
[Edit page](https://github.com/culturecreates/artsdata-data-model/blob/master/{{page.path}}) | <span id="last-modified"></span>

Conventions for naming things. 

# URIs
### Use
* Use [Valid IRIs](https://www.w3.org/TR/rdf11-concepts/#section-rdf-graph)
* Use lowercase protocol http and domain name
* Prefer http instead of https when both are available.
* **For the path** before the last '/' or '#', use lowercase letters seperated by dash "-"
* Always add a path if possible. This makes it easier to write server rules to manage dereferencing (like in nginx) and content negotiation.
* After the last '/' or '#' please use camelCase.
* For properties (predicates) the first letter is lowercase.
* For classes and named entities, the first letter is uppercase.
  
### Avoid
* Do not use snakecase (this_is_snake_case)
* Do not use uppercase in the part that is replaced by the prefix (bad: http://example.com/resource/Place#Montreal)
* Uppercase characters in scheme names (http) and domain names (example.com)
* Percent-encoding of characters where it is not required by IRI syntax
* Explicitly stated HTTP default port (http://example.com:80/); http://example.com/ is preferable
* Completely empty path in HTTP IRIs (http://example.com); http://example.com/ is preferable

### Examples
* http://example.com/resource/ClassName or ex:ClassName
* http://example.com/resource/ontology#EventClass or exo:EventClass
* http://example.com/resource/ontology#propertyName or exo:propertyName
* http://example.com/extra-words/in-path#ClassName or exwp:ClassName

# Graph Names

### Reserved
The following graph names are reserved:
* http://kg.artsdata.ca/minted/
* http://kg.artsdata.ca/ontology/
* http://kg.artsdata.ca/databus
* http://kg.artsdata.ca/graph-ranking

### Artsdata Databus
All data must be imported using the Artsdata Databus. When data in imported using the databus, each version is named as follows:
* http://kg.artsdata.ca/databus/[account]/[group]/[artifact]/[version]

Where:
* account is a free Artsdata account setup for a specific user or organization to upload data
* group is the general grouping of articats usually around a project or software that produces datasets
* artifact is the dataset name
* version is the version of the dataset

The databus only stores the dataset metadata including the downloadUrl for each version. It does not store the actual triples.

Artsdata subscribes to artifacts, and will automatically load the triples of each new version replacing the previous version in the graph.

Graphs are named as follows:
* http://kg.artsdata.ca/[account]/[group]/[artifact]

