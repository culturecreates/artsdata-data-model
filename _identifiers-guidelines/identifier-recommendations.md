---
title: Persistent Identifiers Guidelines
layout: default
nav_order: 0
---

<p>{% include back-button.html %}</p>
{% include language-switcher.html %}

## Artsdata Guidelines regarding Persistent Identifiers

As per the W3C’s RDF specifications for linked open data, each named entity (for example, an event, a place or a person), class and property loaded in the Artsdata triple store must be denoted by a persistent identifier, represented as a URI ([see this article](https://www.artsdata.ca/en/resources/identifiable-and-findable) to learn more about persistent identifiers).

### Supported and recommended persistent identifiers

Artsdata assigns its own persistent identifiers (URIs) to named entities that meet minimum requirements for ID minting. Registered users can use the “Minter” feature to link or mint a new Artsdata ID for entities that are already loaded to the knowledge graph. They can also use the “Mint using Wikidata” feature to load a Wikidata item and mint a new Artsdata ID.

Artsdata also relies on external URIs. Artsdata supports all persistent identifiers from open knowledge bases, including:
- Wikidata;
- ISNI;
- VIAF;
- Musicbrainz.

Artsdata also accepts local URIS minted by data providers (read more below).

In order to guide data providers and consumers in the adoption and implementation of persistent identifiers, here are recommended persistent identifiers according to the entity type.

| Type | Artsdata ID | Wikidata ID | ISNI | Local URI |
| - | - | - | - | - |
| [schema:Person](https://schema.org/Person) | <span style="color:green">**Recommended**</span> | <span style="color:green">**Recommended**</span> | <span style="color:green">**Recommended**</span> | Optional |
| [schema:Organization](https://schema.org/Organization)<br>[schema:PerformingGroup](https://schema.org/PerformingGroup) | <span style="color:green">**Recommended**</span> | <span style="color:green">**Recommended**</span> | Optional | Optional |
| [schema:Place](https://schema.org/Place)<br>[ado:LivePerformanceWork](http://kg.artsdata.ca/ontology/LivePerformanceWork) | <span style="color:green">**Recommended**</span> | <span style="color:green">**Recommended**</span> | Not a valid type for this ID | Optional |
| [schema:Event](https://schema.org/Event) | <span style="color:green">**Recommended**</span> | Optional | Not a valid type for this ID | Optional |

The Artsdata ID, the Wikidata ID and the ISNI are globally-unique persistent identifiers intended to be referenced across a wide range of information systems, outside of their own web domain. This explains why they are sometimes called “global” identifiers, “bridge” identifiers or “external” identifiers. In these guidelines, they are called _external URIs_.

By contrast, “local” identifiers, for example database keys, are meant to be referenced internally, within the local information system. Local identifiers can also be expressed in the form of a URI within the web domain where the system – or the website – is hosted. These _local URIs_ can be reconciled (i.e. matched) with _external URIs_ to indicate that these URIs are identifying the same real-world entity (for example, a person, a place or an event)

In Schema structured data and in the Artsdata data model, _local URIs_ are expected values for the `@id` property, whereas _external URIs_ are expected values for the `sameAs` property.

### How to integrate local URIs to structured data

See: [Artsdata guidelines regarding the @id property and URIs]({{ base }}/identifiers-guidelines/id.html)

### How to integrate external URIs into structured data

See: [Artsdata guidelines regarding the sameAs property]({{ base }}/identifiers-guidelines/sameas.html)

### How to retrieve persistent identifiers' URIs

See : [How to retrieve persistent identifiers' URIs]({{ base }}/identifiers-guidelines/retrieve-uri.html)

### How to store external URIs in a local database

Coming soon...

### About the Artsdata Identifier

The Artsdata ID is a globally-unique persistent identifier for any concept or named entity in the Artsdata knowledge graph. It can be assigned to performing arts entity types for which there exists at present no good persistent identifier (for example, an event). Any entity that meets minimal requirements and that passes SHACL validation can be minted an ID.

Third parties are welcome to contribute to assigning Artsdata IDs. Registered users may:
- Use the “Minter” feature, in the Artsdata interface, to mint or link an ID to an entity loaded to the knowledge graph;
- Use the “Mint using Wikidata” feature, in the Artsdata interface, to load an entity from Wikidata and to mint or link an ID for it;
- Use the Minting API to assign IDs to entities that have not been loaded to Artsdata yet.

#### Specifications
- URI format: `http://kg.artsdata.ca/resource/$1` 
- Regex for the ID: `^K\d+-\d+$`
- Sample URI: `http://kg.artsdata.ca/resource/K12-438`
- Note : The URI format doesn’t use a secured “https” protocol, as is often the case for URIs with content negotiation.
