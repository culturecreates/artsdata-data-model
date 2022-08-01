---
class_name: Organization
layout: class-doc
---

## Controlled vocabulary

[Artsdata Organization Types](http://kg.artsdata.ca/resource/ArtsdataOrganizationTypes) is a controlled vocabulary for organization types used in Artsdata. The goal of this controlled vocabulary is to serve as a base for mapping different types of arts organizations into a common language.  The controlled vocabulary is implemented in SKOS and mapped to Wikidata classes using intermediary SKOS Concepts with skos:closeMatch. 

To use the Artsdata Organization Types please use the schema:additionalType propery on a schema:Organization class.

WIP - here is the Google [spreadsheet](https://docs.google.com/spreadsheets/d/1z_-7oVZJ1zu61nXa7HzQIHQeYugRGewBSM2VPgfC_NA/edit#gid=0)

## Adding organizations to Artsdata.ca

### Required by the Artsdata SHACL validator

* [name](https://schema.org/name) - Indicate language @en, @fr
* [url](https://schema.org/url) - Official URL of the organization
* [address](https://schema.org/address) - Use [PostalAddress](https://schema.org/PostalAddress)

### Recommended
* [additionalType](https://schema.org/additionalType) - Please use the [Artsdata Organization Type](http://kg.artsdata.ca/ontology/ArtsdataOrganizationTypes) controlled vocabulary
* [sameAs](https://schema.org/sameAs) - Please use an Artsdata ID obtained from the Artsdata Reconciliation Service API, and optionally other social media profiles and external global IDs like Wikidata and ISNI.
* [alternateName](https://schema.org/alternateName) - Name typically found on websites. Indicate language @en, @fr

* [areaServed](https://schema.org/areaServed) (pending)
* [contactPoint](https://schema.org/contactPoint) (pending)
* [subOrganization](https://schema.org/subOrganization) (pending)
* [parentOrganization](https://schema.org/parentOrganization) (pending)
* [legalName](https://schema.org/legalName) (pending) - indicate language @en, @fr
* [identifier](https://schema.org/identifier) - Established identifiers like the Canadian Business Number. For example: ({ "@type": "PropertyValue", "propertyID": "BN", "value":  "801228875"})
* [naics](https://schema.org/naics) 

### Mapping to Wikidata
Social media URLs in schema:sameAs and identifiers are automatically mapped to Wikidata properties.
* Facebook ID ([wdt:P2013](http://www.wikidata.org/entity/P2013))
* Twitter username ([wdt:P2002](http://www.wikidata.org/entity/P2002))
* Instagram username ([wdt:P2003](http://www.wikidata.org/entity/P2003))
* Canadian business number ([wdt:P8860](http://www.wikidata.org/entity/P8860))
