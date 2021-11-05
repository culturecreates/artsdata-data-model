---
class_name: Event
layout: class-doc
---

Controlled Vocabulary v2
==========
The Artsdata controlled vocabulary for event categories in RDF using SKOS.

The controlled vocabulary is loaded into Artsdata using the [Artsdata Databus API](https://documenter.getpostman.com/view/3157443/TVep7mv3) and the resulting categories can be viewed here [ArtsdataEventCategories](http://kg.artsdata.ca/ontology/ArtsdataEventCategories).

For example an Event can be assigned the category [PerformingArtsEvent](http://kg.artsdata.ca/ontology/PerformingArtsEvent) showing narrower and broader concepts using SKOS.

This is a WIP - work in progress. For the latest changes and edits visit [Google Sheet](https://docs.google.com/spreadsheets/d/1ud_kVTE8C97ZMoe1uYGQ6rW_dodKqsbqiCutLLHO9jo/edit?usp=sharing) to view the pending (not yet published) version of the Artsdata controlled vocabulary and mapping to other vocabularies. 

The release history is located [here](https://github.com/culturecreates/artsdata-data-model/commits/master/ontology/skos-event-categories.ttl).

Your input is welcome. Please click the link above to open an issue.

### How to use

The Artsdata Event Controlled Vocabulary is used with the schema.org Event types.  An Event in Artsdata has a schema.org Event type (usually schema:Event or schema:EventSeries) as well as an additional type from the Artsdata Event Controlled Vocabulary using the schema:additionalType property.

Events are linked to the Artsdata Event Types using schema:additionalType.

For example: `ex:Event1 a schema:Event ; schema:additionalType ado:CircusEvent .`
