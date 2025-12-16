---
class_name: LivePerformanceWork
layout: class-live-performance-work-doc
---
# Live Performance Work
A live performance qork in Artsdata is defined as a "work containing an ensemble of creative elements, design elements (intangible and tangible), and plans intended to be performed in front of an audience". 

[`ado:LivePerformanceWork`](http://kg.artsdata.ca/ontology/LivePerformanceWork) is a subclass of [LRMoo F1:Work](https://cidoc-crm.org/f1-work) and an equivalent to [milopa:PERFORMANCE_WORK](https://github.com/pair-cg/milopa).


## Properties

Coming soon


## Sample Structured Data

Here is sample `@type Event` structured data, with a nested `ado:LivePerformanceWork` entity under the property `workPerformed`. This example is based on a series of performances of the work * Orpheus | S'abreuver des volcans * by Alan Lake Factori(e), which is well described on the [company's website](https://alanlakefactorie.org/portfolio/orpheus-sabreuver-des-volcans/) and in the [Scène Pro directory](https://scenepro.ca/offres-de-spectacles/Orpheus%20%7C%20S'abreuver%20des%20volcans-7276).

```
{
    "@context": "https://schema.org",
    "id": "http://kg.artsdata.ca/resource/K23-2815",
    "@type": "EventSeries",
    "additionalType": "http://kg.artsdata.ca/resource/PerformingArtsEvent",
    "sameAs": "http://kg.footlight.io/resource/placedesarts-com_alan-lake-factorie",
    "location": {
        "id": "http://kg.artsdata.ca/resource/K11-22",
        "type": "Place",
        "sameAs": "http://www.wikidata.org/entity/Q42986539",
        "name": "Place des Arts - Cinquième Salle"
        },
    "startDate": "2025-04-01T20:00:00-04:00",
    "endDate": "2025-04-05T22:00:00-04:00",
    "name": "Alan Lake Factori(e) - S’abreuver des volcans",
    "url": "https://www.dansedanse.ca/fr/spectacles/alan-lake-factorie-sabreuver-des-volcans",
    "workPerformed": {
        "@type": "CreativeWork",
        "additionalType": "http://kg.artsdata.ca/resource/LivePerformanceWork",
        "name": "Orpheus | S'abreuver des volcans",
        "url": "https://alanlakefactorie.org/portfolio/orpheus-sabreuver-des-volcans/",
        "mainEntityOfPage": "https://scenepro.ca/offres-de-spectacles/Orpheus%20%7C%20S'abreuver%20des%20volcans-7276",
        "genre": [
                "http://www.wikidata.org/entity/Q11639",
                "http://vocab.getty.edu/page/aat/300054144"
                ],
        "about": {
            "@type": "Person",
            "name": "Orpheus",
            "sameAs": "http://www.wikidata.org/entity/Q174353"
            },
       "creator": {
            "@type": "Person",
            "name": "Alan Lake",
            "sameAs": "http://www.wikidata.org/entity/Q64925368"
            },
        "producer": {
            "@type": "Organization",
            "name": "Alan Lake Factori(e)",
            "url": "https://alanlakefactorie.org/"
            },
        "image": "https://images.scenepro.ca/uploads%2Fshowmain/692957167540869-image.png",
        "inlanguage": "fr",
        "audience": {
            "@type": "Audience",
            "name": "Tous publics",
            "disambiguatingDescription": "Term from the Scène Pro audience vocabulary designating 'General audiences'"
            }
        },
    "performer": {
        "@type": "Organization",
        "name": "Alan Lake Factori(e)",
        "url": "https://alanlakefactorie.org/"
        },
     "subEvent": [
         {
         "@id": "http://kg.footlight.io/resource/placedesarts-com_alan-lake-factorie#2025-04-01T200000-0400",
         "@type": "Event",
         "location": "http://kg.artsdata.ca/resource/K11-22",
         "name": "Alan Lake Factori(e) - S’abreuver des volcans",
         "startDate": "2025-04-01T20:00:00-04:00"
          },
         {
         "@id": "http://kg.footlight.io/resource/placedesarts-com_alan-lake-factorie#2025-04-02T200000-0400",
         "@type": "Event",
         "location": "http://kg.artsdata.ca/resource/K11-22",
         "name": "Alan Lake Factori(e) - S’abreuver des volcans",
         "startDate": "2025-04-02T20:00:00-04:00"
          },
         {
         "@id": "http://kg.footlight.io/resource/placedesarts-com_alan-lake-factorie#2025-04-03T200000-0400",
         "@type": "Event",
        "location": "http://kg.artsdata.ca/resource/K11-22",
         "name": "Alan Lake Factori(e) - S’abreuver des volcans",
          "startDate": "2025-04-03T20:00:00-04:00"
          },
         {
          "@id": "http://kg.footlight.io/resource/placedesarts-com_alan-lake-factorie#2025-04-04T200000-0400",
          "@type": "Event",
          "location": "http://kg.artsdata.ca/resource/K11-22",
         "name": "Alan Lake Factori(e) - S’abreuver des volcans",
         "startDate": "2025-04-04T20:00:00-04:00"
         },
         {
         "@id": "http://kg.footlight.io/resource/placedesarts-com_alan-lake-factorie#2025-04-05T200000-0400",
         "@type": "Event",
         "location": "http://kg.artsdata.ca/resource/K11-22",
         "name": "Alan Lake Factori(e) - S’abreuver des volcans",
         "startDate": "2025-04-05T20:00:00-04:00"
         }
    ]
}
```


For more information about the development of the `ado:LivePerformanceWork` class, please consult this [GitHub discussion](https://github.com/culturecreates/artsdata-data-model/discussions/133).
