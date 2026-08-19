---
class_name: LivePerformanceWork (fr)
layout: class-live-performance-work-doc
nav_order: 104
title: LivePerformanceWork (fr)
nav_exclude: true
---

# Œuvre scénique

Dans Artsdata, une *œuvre scénique* (aussi appelée « spectacle ») est définie comme une « œuvre composée d'un ensemble d'éléments créatifs, de conceptions (intangibles et tangibles) et de plans destinée à être exécutée pour un public ».

La classe [ado:LivePerformanceWork](http://kg.artsdata.ca/ontology/LivePerformanceWork) est considérée comme une sous-classe de [lrmoo:F1_Work](https://cidoc-crm.org/extensions/lrmoo/html/LRMoo_v1.1.1.html#F1) et une classe équivalente à [milopa:PERFORMANCE_WORK](https://github.com/pair-cg/milopa) et à [datascene:Spectacle](https://documentation.datascene.ca/references/show/).

## Propriétés

Le profil d'application de la classe `ado:LivePerformanceWork` est en cours de dévéloppement et sera publié sous peu. Il importera des propriétés de Schema.org, LRMoo et Wikidata. Il sera par ailleurs mis en correspondance avec d'autres ontologies RDF.

## Vocabulaire contrôlés des genres d'Artsdata

Artsdata peut réconcilier automatiquement des chaînes de caractères désignant des genres avec les concepts du [Vocabulaire contrôlé Artsdata pour les genres](https://docs.artsdata.ca/genres.fr.html). Les valeurs de la propriété `schema:genre` peuvent être soit des chaînes de caractères, soit des URI, soit des objets de type `schema:DefinedTerm`.

## Exemple de données structurées

Voici un exemple de données structurées d'une entité de type `ado:LivePerformanceWork`. Cet exemple est basé sur l'œuvre scénique *`Orpheus | S'abreuver des volcans`* par Alan Lake Factori(e), qui est bien décrite sur le [site web de la compagnie](https://alanlakefactorie.org/portfolio/orpheus-sabreuver-des-volcans/) et dans le [répertoire Scène Pro](https://scenepro.ca/offres-de-spectacles/Orpheus%20%7C%20S'abreuver%20des%20volcans-7276).

```
{
  "@context": "https://schema.org",
  "@type": [
    "CreativeWork",
    "PerformanceWork"
    ],
  "additionalType": "http://kg.artsdata.ca/ontology/LivePerformanceWork",
  "name": "Orpheus | S'abreuver des volcans",
  "sameAs": "http://www.wikidata.org/entity/Q135182394",
  "url": "https://alanlakefactorie.org/portfolio/orpheus-sabreuver-des-volcans/",
  "mainEntityOfPage": "https://scenepro.ca/offres-de-spectacles/Orpheus%20%7C%20S'abreuver%20des%20volcans-7276",
  "image": "https://images.scenepro.ca/uploads%2Fshowmain/692957167540869-image.png",
  "description": "Orpheus | S’abreuver des volcans réinvente le mythe de la traversée; une plongée viscérale dans les ténèbres, en quête de lien et de renaissance.",
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
  "contributor": {
    "@type": "Role",
    "roleName": "Choreographer",
    "contributor": {
      "@type": "Person",
      "name": "Alan Lake",
      "sameAs": "http://www.wikidata.org/entity/Q64925368"
      }
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
    ],
  "audience": {
    "@type": "Audience",
    "name": "Tous publics",
    "disambiguatingDescription": "Term from the Scène Pro audience vocabulary designating 'General audiences'"
    }
}
```

Pour en savoir plus à propos du développement de la classe `ado:LivePerformanceWork`, veuillez consulter cette [discussion GitHub](https://github.com/culturecreates/artsdata-data-model/discussions/133).
