---
class_name: LivePerformanceWork (fr)
layout: class-live-performance-work-doc
---
# Œuvre scénique

Dans Artsdata, une œuvre scénique est defini comme une « œuvre composée d'un ensemble d'éléments créatifs, de conceptions (intangibles et tangibles) et de plans destinée à être exécutée pour un public ».

La classe [`ado:LivePerformanceWork`](http://kg.artsdata.ca/ontology/LivePerformanceWork) est considérée comme une sous-classe de [LRMoo F1:Work](https://cidoc-crm.org/f1-work), une classe équivalente à [milopa:PERFORMANCE_WORK](https://github.com/pair-cg/milopa) et une classe quasi-équivalente à [datascene:Spectacle](https://datascene.ca/modele/classes_principales/).


## Propriétés

À venir


## Exemple de données structurées

Voici un exemple de données structurées du `@type Event`, avec une entité imbriquée `LivePerformanceWork` sous la propriété `workPerformed`. Cet exemple est basé sur une série de représentations de l'œuvre * Orpheus | S'abreuver des volcans * par Alan Lake Factori(e), qui est bien décrite sur le [site web de la compagnie](https://alanlakefactorie.org/portfolio/orpheus-sabreuver-des-volcans/) et dans le [répertoire Scène Pro](https://scenepro.ca/offres-de-spectacles/Orpheus%20%7C%20S'abreuver%20des%20volcans-7276).

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


Pour en savoir plus à propos du développement de la classe `ado:LivePerformanceWork`, veuillez consulter cette [discussion GitHub](https://github.com/culturecreates/artsdata-data-model/discussions/133).
