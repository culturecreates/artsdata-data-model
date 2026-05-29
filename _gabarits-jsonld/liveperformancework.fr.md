---
title: Gabarits de données structurées pour les œuvres scéniques
layout: gabarits-doc
nav_order: 108
nav_exclude: true
---

Gabarits de données structurées pour les œuvres scéniques
=====================================

Gabarits de données structurées au format JSON-LD s'appuyant sur le vocabulaire Schema.org.

Ceci est document de travail pour des gabarits de données structurées décrivant des [œuvres scéniques](http://kg.artsdata.ca/ontology/LivePerformanceWork) (c.-à-d. des « spectacles »).

Note : La classe `schema:PerformanceWork` et la propriété `schema:isPerformedIn` ont été approuvées mais ne sont pas encore déployées dans l'ontologie Schema. Une demande de fusion est toujours en attente. Vous pouvez suivre l'évolution dans cet [discussion GitHub](https://github.com/schemaorg/schemaorg/issues/4467).

Si vous mettez en œuvre ce gabarit, nous vous prions de nous en aviser pour que nous puissions constater le résultat.

### Aperçu

```
{
   "@context":"http://schema.org",
   "@type":"CreativeWork",
   "@id":"--URI constituant un identifiant unique de l'œuvre spectacle. Optionnel : URI constituting a unique identifier of the live performance work (i.e. show). Optional--",
   "additionalType":[
      "https://schema.org/PerformanceWork",
      "http://kg.artsdata.ca/ontology/LivePerformanceWork"
   ],
   "name":"--Titre de l'œuvre : Title of the work--",
   "url":"--URL officiel de la page Web de l'œuvre : Official URL of the work's webpage--",
   ...
```

### Gabarit complet

Consultez le [gabarit JSON-LD complet dans GitHub](https://github.com/culturecreates/artsdata-data-model/blob/master/_gabarits-jsonld/LivePerformanceWork/LivePerformanceWork.jsonld)

### Exemples

À venir...
