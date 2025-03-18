<p>{% include back-button.html %}</p>
<a href='sameas-guidelines.html'><img src='https://img.shields.io/badge/lang-en-blue.svg'></a>
<a href='sameas-guidelines.fr.html'><img src='https://img.shields.io/badge/lang-fr-green.svg'></a>

## Artsdata Guidelines about the schema:sameAs property

Along with `@id`, the [`schema:sameAs`](https://schema.org/sameAs) property offers another excellent means of unambiguously identifying Things in Schema structured data.

Artsdata recommends populating the `sameAs` property with a [persistent identifier](https://www.artsdata.ca/en/resources/identifiable-and-findable), in URI format. Always enter persistent identifiers in full URI format (rather than entering just the identifier’s string). For example, for the short-form Wikidata ID `Q596774`, the matching URI is `http://www.wikidata.org/entity/Q596774`.

Artsdata strongly recommends persistent identifiers from open knowledge bases and authority files (see the list of supported identifiers), because they are machine-actionable: Artsdata can dereference these URIs to access all available descriptive metadata about the entity they identify.

The `sameAs` property can be used both on first-level objects and on nested entities, as in this example:

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

Arrays of values are possible, although not entirely necessary. A single Wikidata or VIAF URI can be dereferenced to retrieve several other persistent identifiers.

Social media accounts may also be populated under `sameAs`. Again, this may not be necessary: if the entity is already identified with a Wikidata URI (or an Artsdata URI linked with a Wikidata URI), any robot can dereference the Wikidata URI to retrieve all social media and streaming platform accounts associated with this entity in Wikidata. If these accounts are listed in Wikidata, listing them under sameAs would be redundant from a machine standpoint.

