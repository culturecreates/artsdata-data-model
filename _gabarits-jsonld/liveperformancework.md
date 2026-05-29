---
title: Live Performance Work Structured Data Templates
layout: gabarits-doc
nav_order: 8
---

Structured Data Templates for Live Performance Works
=====================================

The contents of this document are under a Creative Commons - Attribution 4.0 license.

This is an evolving document for a Schema structured data template describing [live performance works](http://kg.artsdata.ca/ontology/LivePerformanceWork) (i.e. a show or production).

Note : The `schema:PerformanceWork` class and the `schema:isPerformedIn` property are approved for creation but awaiting pull request merger in the Schema ontology ([check pending issues](https://github.com/schemaorg/schemaorg/issues/4467)).

If you try out this JSON-LD template please contact Artsdata to let us know. We would love to see your structured data in action.

### Preview

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

### Full template

See the [full JSON-LD template in GitHub](https://github.com/culturecreates/artsdata-data-model/blob/master/_gabarits-jsonld/LivePerformanceWork/LivePerformanceWork.jsonld)
