---
class_name: Event
layout: class-doc
---

An `Event` in Artsdata is defined as: “an organized activity that occurs at a specific time and location”. The [`adr:Event`](http://kg.artsdata.ca/resource/Event) is deemed an equivalent class to [`schema:Event`](https://schema.org/Event). 

Any single performance, run of performances, or festival edition is deemed an `Event` or `EventSeries` type entity in Artsdata.

## Event Types

Event type entities can be assigned additional types from the [Artsdata controlled vocabulary for event types](../event-type.html), using the `additionalType` property.

In addition to concepts from the Artsdata controlled vocabulary, Artsdata accepts Schema.org Event sub-types as well as Wikidata concepts as additional types.

## Minting Artsdata IDs for Events

In order for Artsdata to automatically create a unique ID for an event, the event must minimally have these three attribute–value pairs:

- `@Type`: `Event` (or an Event sub-type);
- `startTime`: `dateTime` value with a time zone offset;
- `location`: `Place` with a sameAs link to a Wikidata or Artsdata URI.

If the startTime value is incomplete or if the Place entity does not have a sameAs link to an identifier, it is still possible to manually assign an ID, as long as at least one of the following properties is used:
- `name`;
- `description`;
- `url`.

In the absence of a Place URI, a postal code can be useful to identify potential duplicate event records.
