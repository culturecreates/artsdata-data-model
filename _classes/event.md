---
class_name: Event
layout: class-doc
---

Event Types Controlled Vocabulary [v1](https://github.com/culturecreates/artsdata-data-model/commits/master/ontology/ontology-event-types.ttl)
==========
The Artsdata controlled vocabulary for event types in RDF is located [here](https://github.com/culturecreates/artsdata-data-model/tree/master/ontology).

[v1](https://github.com/culturecreates/artsdata-data-model/commits/master/ontology/ontology-event-types.ttl) is the first published version. It replaces the previous placeholder [<http://ontology.artsdata.ca/Performance>](http://ontology.artsdata.ca/Performance).

The controlled vocabulary is loaded into Artsdata using the [Artsdata Databus API](https://documenter.getpostman.com/view/3157443/TVep7mv3) and the resulting graph can be viewed [here](http://kg.artsdata.ca/ontology/event-types) along with an example [PerformanceEvent](http://kg.artsdata.ca/ontology/PerformanceEvent) type showing narrower and broader concepts using SKOS.

This is a WIP - work in progress. For the latest changes and edits visit [Airtable](https://airtable.com/shrtyQWqYTvWihO7Y) to view the pending (not yet published) version of the Artsdata controlled vocabulary and mapping to other vocabularies. 

Your input is welcome. Please click the link above to open an issue.

### How to use

The Artsdata Event Types are used in addition to the schema.org Event types.  Event in Artsdata has a schema.org Event type (usually schema:Event or schema:EventSeries) as well as an Artsdata Event type using the schema:additionalType property.

Events are linked to the Artsdata Event Types using schema:additionalType.

For example: `ex:Event1 rdfs:type schema:Event ; schema:additionalType ado:CircusEvent .`
