## Artsdata Guidelines about the schema:sameAs property

Along with `@id`, the [`schema:sameAs`](https://schema.org/sameAs) property offers another excellent means of unambiguously identifying Things in Schema structured data.

Artsdata recommends populating the `sameAs` property with a persistent identifier, in URI format. Always enter persistent identifiers in full URI format (rather than entering just the identifier’s string). For example, for the short-form Wikidata ID `Q596774`, the matching URI is `http://www.wikidata.org/entity/Q596774`.

Artsdata strongly recommends persistent identifiers from open knowledge bases and authority files (see the list of supported identifiers), because they are machine-actionable: Artsdata can dereference these URIs to access all available descriptive metadata about the entity they identify.

The `sameAs` property can be used both on first-level objects and on nested entities, as in this example:

Arrays of values are possible, although not entirely necessary. A single Wikidata or VIAF URI can be dereferenced to retrieve several other persistent identifiers.

Social media accounts may also be populated under `sameAs`. Again, this may not be necessary: if the entity is already identified with a Wikidata URI (or an Artsdata URI linked with a Wikidata URI), any robot can dereference the Wikidata URI to retrieve all social media and streaming platform accounts associated with this entity in Wikidata. If these accounts are listed in Wikidata, listing them under sameAs would be redundant from a machine standpoint.

