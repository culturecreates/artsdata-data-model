---
class_name: Event
layout: class-doc
---

Event Types Controlled Vocabulary [v1](https://github.com/culturecreates/artsdata-data-model/commits/master/ontology/ontology-event-types.ttl)
==========
The Artsdata controlled vocabulary for event types in RDF is located [here](https://github.com/culturecreates/artsdata-data-model/tree/master/ontology).

[v1](https://github.com/culturecreates/artsdata-data-model/commits/master/ontology/ontology-event-types.ttl) is the first version. It replaces previous placeholders including [<http://ontology.artsdata.ca/Performance>](http://ontology.artsdata.ca/Performance).

The controlled vocabulary is loaded into Artsdata using the Databus and the resulting graph can be viewed [here](http://kg.artsdata.ca/ontology/event-types) along with an example [PerformanceEvent](http://kg.artsdata.ca/ontology/PerformanceEvent) type showing narrower and broader concepts using SKOS.

This is a WIP - work in progress. For the latest changes and edits visit [Airtable](https://airtable.com/shrtyQWqYTvWihO7Y) to view the pending (not yet published) version of the Artsdata controlled vocabulary and mapping to other vocabularies. 

Your input is welcome. Please click the link above to open an issue. The Artsdata controlled vocabulary of event types is used in addition to the schema.org Event types.  Each event in Artsdata has a schema.org Event type (usually schema:Event or schema:EventSeries) as well as an Artsdata Event type (schema:additionalType).

### How to use

A schema:Event is linked to the Artsdata event type using schema:additionalType property.

For example: `ex:Event1 schema:type schema:Event ; schema:additionalType ado:PerformanceEvent .`
