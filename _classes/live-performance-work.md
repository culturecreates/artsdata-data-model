---
class_name: LivePerformanceWork
layout: class-live-performance-work-doc
nav_order: 6
title: LivePerformanceWork
---

# Live Performance Work

A live performance work in Artsdata is defined as a "work containing an ensemble of creative elements, design elements (intangible and tangible), and plans intended to be performed in front of an audience". 

[ado:LivePerformanceWork](http://kg.artsdata.ca/ontology/LivePerformanceWork) is a subclass of [lrmoo:F1_Work](https://cidoc-crm.org/extensions/lrmoo/html/LRMoo_v1.1.1.html#F1) and an equivalent class to [milopa:PERFORMANCE_WORK](https://github.com/pair-cg/milopa) and [datascene:Show](https://documentation.datascene.ca/references/show/).

## Properties

The application profile for `ado:LivePerformanceWork` is currently in development and will be published soon. It will import properties from Schema.org, LRMoo and Wikidata, and will be mapped to other RDF ontologies.

## Artsdata Genres Controlled Vocabulary

Artsdata can automatically reconcile `genre` strings against concepts in the [Artsdata Genres Controlled Vocabulary](http://kg.artsdata.ca/resource/ArtsdataGenres). `schema:genre` values can either be text strings, URIs of schema:DefinedTerm objects.

## Sample Structured Data

Here is sample `ado:LivePerformanceWork` structured data. This example is based on a performance of the work *`Orpheus | S'abreuver des volcans`* by Alan Lake Factori(e), which is well described on the [company's website](https://alanlakefactorie.org/portfolio/orpheus-sabreuver-des-volcans/) and in the [Scène Pro directory](https://scenepro.ca/offres-de-spectacles/Orpheus%20%7C%20S'abreuver%20des%20volcans-7276).

```
{
  "@context": "https://schema.org",
  "@type": [
    "CreativeWork",
    "http://kg.artsdata.ca/ontology/LivePerformanceWork"
    ],
  "name": "Orpheus | S'abreuver des volcans",
  "url": "https://alanlakefactorie.org/portfolio/orpheus-sabreuver-des-volcans/",
  "sameAs": "http://www.wikidata.org/entity/Q135182394",
  "mainEntityOfPage": "https://scenepro.ca/offres-de-spectacles/Orpheus%20%7C%20S'abreuver%20des%20volcans-7276",
  "genre": {
    "@type": "DefinedTerm",
    "name": "Danse",
    "sameAs": [
      "http://kg.artsdata.ca/resource/K6-200",
      "http://vocab.getty.edu/page/aat/300054144",
      "http://www.wikidata.org/entity/Q11639"
      ]
    },
  "inLanguage": "fr",
  "creator": {
    "@type": "Person",
    "name": "Alan Lake",
    "sameAs": "http://www.wikidata.org/entity/Q64925368"
    },
  "producer": [
    {
    "@type": "Organization",
    "name": "Alan Lake Factori(e)",
    "sameAs": "http://www.wikidata.org/entity/Q135182548"
      },
    {
    "@type": "Organization",
    "name": "Diffusion Momentum",
    "alternateName": "Carré 150 – Espace culturel de Victoriaville",
    "sameAs": "http://www.wikidata.org/entity/Q118097169"
      }
    ]
}
```


For more information about the development of the `ado:LivePerformanceWork` class, please consult this [GitHub discussion](https://github.com/culturecreates/artsdata-data-model/discussions/133).
