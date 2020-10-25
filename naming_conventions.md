{% include last-modified.html %}
 
Naming Conventions
===================
[Edit page](https://github.com/culturecreates/artsdata-data-model/blob/master/{{page.path}}) | <span id="last-modified"></span>

Conventions for naming things will be added here as needed.

# Graph Names
### Use
* [Valid IRIs](https://www.w3.org/TR/rdf11-concepts/#section-rdf-graph)
* **For the path** after the last front slash, use uppercase words seperated by "_" 

### Avoid
* Uppercase characters in scheme names (http) and domain names (example.com)
* Percent-encoding of characters where it is not required by IRI syntax
* Explicitly stated HTTP default port (http://example.com:80/); http://example.com/ is preferable
* Completely empty path in HTTP IRIs (http://example.com); http://example.com/ is preferable

### Examples
* http://example.com/
* http://example.com/Graph
* http://example.com/Another_Graph
* http://example.com/resource/Named_Entity
