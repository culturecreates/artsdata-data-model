---
class_name: Organization
layout: class-doc
nav_order: 8
title: Organization
---

## Organization Type

[Artsdata Organization Types](http://kg.artsdata.ca/resource/ArtsdataOrganizationTypes) is a controlled vocabulary for organization types used in Artsdata. The goal of this controlled vocabulary is to serve as a base for mapping different types of arts organizations into a common language. In this vocabulary, the parent concept [adr:Organization](http://kg.artsdata.ca/resource/Organization) is defined as "A structured group of people, united by a common purpose - this includes both groups that are formally structured as a legal body (e.g., a not-for-profit corporation) as well as those that are informally structured, but otherwise act together."

The controlled vocabulary is implemented in SKOS and mapped to Wikidata classes using intermediary SKOS Concepts with skos:closeMatch. 

To use the Artsdata Organization Types please use the schema:additionalType property on a schema:Organization class.

You can download the complete controlled vocabulary with this [download link](https://db.artsdata.ca/repositories/artsdata/statements?context=%3Chttp://kg.artsdata.ca/culture-creates/ontology/artsdata-organization-types%3E).

WIP - here is the Google [spreadsheet](https://docs.google.com/spreadsheets/d/1wPzZI3G48q02H_II91Bs6ljZFbC0KcSAPzDDK0dtGN8/edit#gid=1933025380)

## Adding organizations to Artsdata.ca

### Structured data template
* [Arts Organization Structured Data Template](https://docs.google.com/document/d/1e_2pVYaGYkVxKtl6Y6btrHYrIyqoNf_6yeSl4dRJLbI/edit?tab=t.0#heading=h.fn96d7fxizbh)

### Required by the Artsdata SHACL validator

* [name](https://schema.org/name) - Indicate language @en, @fr
* [url](https://schema.org/url) - Official URL of the organization
* [address](https://schema.org/address) - Use [PostalAddress](https://schema.org/PostalAddress)

### Recommended
* [additionalType](https://schema.org/additionalType) - Please use the [Artsdata Organization Type](http://kg.artsdata.ca/ontology/ArtsdataOrganizationTypes) controlled vocabulary
* [sameAs](https://schema.org/sameAs) - Please use an Artsdata ID obtained from the Artsdata Reconciliation Service API, and optionally other social media profiles and external global IDs like Wikidata and ISNI.
* [alternateName](https://schema.org/alternateName) - Name typically found on websites. Indicate language @en, @fr

* [areaServed](http://schema.org/areaServed) (pending)
* [contactPoint](http://schema.org/contactPoint) (pending)
* [subOrganization](http://schema.org/subOrganization) (pending)
* [parentOrganization](http://schema.org/parentOrganization) (pending)
* [legalName](http://schema.org/legalName) (pending) - indicate language @en, @fr
* [identifier](http://schema.org/identifier) - Established identifiers like the Canadian Business Number. For example: ({ "@type": "PropertyValue", "propertyID": "BN", "value":  "801228875"})
* [naics](htp://schema.org/naics) 
* [department](http://schema.org/department) (pending)

### Mapping to Wikidata
Social media URLs in schema:sameAs and identifiers are automatically mapped to Wikidata properties.
* Facebook ID ([wdt:P2013](http://www.wikidata.org/entity/P2013))
* Twitter username ([wdt:P2002](http://www.wikidata.org/entity/P2002))
* Instagram username ([wdt:P2003](http://www.wikidata.org/entity/P2003))
* Canadian business number ([wdt:P8860](http://www.wikidata.org/entity/P8860))
* Numéro d'entreprise du Québec ([wdt:P10503](http://www.wikidata.org/entity/P10503))
