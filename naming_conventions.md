{% include last-modified.html %}
 
Naming Conventions
===================
[Edit page](https://github.com/culturecreates/artsdata-data-model/blob/master/{{page.path}}) | <span id="last-modified"></span>

Conventions for naming things will be added here as needed.

# Resource Names
### Use
* lowercase starting at http and until reaching the name of the class or property.  This part is interchangeable with a short lowercase prefix.
* following the last '/' please use camelCase. For properties the first letter is lowercase. For Classes the first letter is uppercase.
* When using # (hash) everything before the hash is interchangeable with the prefix and should be lower case. After the # please use camelCase.

### Avoid
* Do not use snakecase (this_is_snake_case)
* Do not use uppercase in the part that is replaced by the prefix (bad: http://example.com/resource/Place#Montreal)

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
* http://kg.artdata.ca/graph-ranking

### Artsdata Databus
All data must be imported using the Artsdata Databus. When data in imported using the databus, the graphs are automatically names as follows:
* http://kg.artsdata.ca/[account]/[group]/[artifact]/[version]

Parameters:
* account is a free Artsdata account setup for a specific user to upload data
* group is the general grouping of articats usually around a project or software that produces datasets
* artifact is the dataset name
* version is the version of the dataset


### Use
* [Valid IRIs](https://www.w3.org/TR/rdf11-concepts/#section-rdf-graph)
* **For the path** after the last '/' (front slash), use lowercase letters seperated by dash "-" 

### Avoid
* Uppercase characters in scheme names (http) and domain names (example.com)
* Percent-encoding of characters where it is not required by IRI syntax
* Explicitly stated HTTP default port (http://example.com:80/); http://example.com/ is preferable
* Completely empty path in HTTP IRIs (http://example.com); http://example.com/ is preferable

### Examples
* http://example.com/
* http://example.com/graph
* http://example.com/another-graph
* http://example.com/resource/named-entity-id
