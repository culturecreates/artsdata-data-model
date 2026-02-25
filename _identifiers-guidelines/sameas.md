---
title: sameAs Property Guidelines
layout: identifiers-guidelines-doc
nav_order: 3
---

## Artsdata Guidelines about the schema:sameAs property

Along with [`@id` property]({{ base }}/identifiers-guidelines/id.html), the [`schema:sameAs`](https://schema.org/sameAs) property offers another excellent means of unambiguously identifying Things in Schema structured data.

Artsdata recommends populating the `sameAs` property with a [persistent identifier](https://www.artsdata.ca/en/resources/identifiable-and-findable), in URI format. Here is some additional information on how to retreive a URI: {{ base }}/identifiers-guidelines/retrieve-uri.html  

Always enter persistent identifiers in full URI format (rather than entering just the identifier’s string). For example, for the short-form Wikidata ID `Q596774`, the matching URI is `http://www.wikidata.org/entity/Q596774`.

Artsdata strongly recommends persistent identifiers from open knowledge bases and authority files (see the [list of supported identifiers]({{ base }}/identifiers-guidelines/identifier-recommendations.html)), because they are machine-actionable: Artsdata can dereference these URIs to access all available descriptive metadata about the entity they identify.

The `sameAs` property can be used on both top-level objects and nested entities. In the following example, the `sameAs` property is populated both for the top-level `Event` type entity, and for entities nested under the `location`, `organizer` and `performer` properties.

```
{
    "@context": "https://kg.artsdata.ca/context.jsonld",
    "@type": "Event",
    "@id": "https://scenesfrancophones.ca/id/6130",
    "sameAs": "http://kg.artsdata.ca/resource/K43-1002",
    "name": "Maten - Utenat",
    "url": "https://scenesfrancophones.ca/spectacles/maten-utenat-6130",
    "startDateTime": "2025-05-01T19:30:00-03:00",
    "location": {
                "@type": "Place",
                "@id": "https://scenesfrancophones.ca/id/467",
                "name": "Théâtre Gilles-Laplante",
                "sameAs": "http://www.wikidata.org/entity/Q117093397",
                "address": {
                    "@type": "PostalAddress",
                    "streetAddress": "300, chemin Beaverbrook",
                    "addressLocality": "Miramichi",
                    "addressRegion": "NB",
                    "postalCode": "E1V 1A1",
                    "addressCountry": "CA"
                    },
                },
    "description": "Le groupe innu Maten est originaire de Mani-Utenam, sur la Côte Nord du Québec...",
    "image": "https://scenesfrancophones.ca/sites/default/files/styles/large/public/2024-07/Maten%20-%20Sf.png?itok=qjWZfzae",
    "organizer": {
                "@type": "Organization",
                "@id": "https://scenesfrancophones.ca/id/37",
                "name": "Carrefour communautaire Beausoleil",
                "sameAs": "http://www.wikidata.org/entity/Q133105414"
            },
    "performer": {
                "@type": "PerformingGroup",
                "@id": "https://scenesfrancophones.ca/id/6108",
                "name": "Maten",
                "sameAs": [
                        "https://isni.org/isni/0000000491339041",
                        "http://www.wikidata.org/entity/Q112681868"
                        ]
                }
}
```

It is possible to populate several `sameAs` values for the same entity. In the previous example, under `performer` property, the entity named "Maten" has an array of `sameAs` values (delineated by square brackets) containing both an ISNI URI and a Wikidata URI. This is however not necessary. In most cases, a single Wikidata or VIAF URI is enough, since it can be dereferenced to retrieve several other persistent identifiers.

Social media and streaming platforms' accounts may also be populated under `sameAs`. Again, this may not be necessary: if the entity is already identified with a Wikidata URI (or an Artsdata URI linked with a Wikidata URI), any robot can dereference the Wikidata URI to retrieve all social media and streaming platform accounts associated with this entity in Wikidata. In other words, if these accounts are listed in Wikidata, listing them under sameAs would be redundant from a machine standpoint.

### Related contents
- [What are persistent identifiers and why do they matter?](https://www.artsdata.ca/en/resources/identifiable-and-findable)
- [Artsdata Guidelines regarding Persistent Identifiers]({{ base }}/identifiers-guidelines/identifier-recommendations.html)
  - [Artsdata guidelines regarding the @id property and URIs]({{ base }}/identifiers-guidelines/id.html)
  - [How to retrieve persistent identifiers' URIs]({{ base }}/identifiers-guidelines/retrieve-uri.html)
