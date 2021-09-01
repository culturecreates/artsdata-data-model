---
class_name: Event
layout: class-doc
---

Event Types Controlled Vocabulary 
==========
The Artsdata controlled vocabulary for event types in RDF is located [here](https://github.com/culturecreates/artsdata-data-model/tree/master/ontology).

The controlled vocabulary is loaded into Artsdata using the Databus and the resulting graph can be viewed [here](http://kg.artsdata.ca/ontology/event-types) along with an example [PerformanceEvent](http://kg.artsdata.ca/ontology/PerformanceEvent) type showing narrower and broader concepts using SKOS.

Follow this Airtable [link](https://airtable.com/shrtyQWqYTvWihO7Y) to view the Artsdata controlled vocabulary for event types and sub-types and the mapping to other vocabularies. 

This is a Work In Progress. Your input in welcome. Please click the link above to open an issue. The Artsdata controlled vocabulary of event types is used in addition to the schema.org Event types.  Each event in Artsdata has a schema.org Event type as well as an Artsdata Event type (schema:additionalType).

### How to use

A schema:Event is linked to the Artsdata event type using schema:additionalType property.

For example: `ex:Event1 schema:type schema:Event ; schema:additionalType ado:PerformanceEvent .`
