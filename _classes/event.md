---
class_name: Event
layout: class-event-doc
---
# Event
An `Event` in Artsdata is defined as: “an organized activity that occurs at a specific time and location”. The [`adr:Event`](http://kg.artsdata.ca/resource/Event) is deemed an equivalent class to [`schema:Event`](https://schema.org/Event). 

Any single performance, run of performances, or festival edition is deemed an `Event` or `EventSeries` type entity in Artsdata.

## Event Types

Event type entities can be assigned additional types from the [Artsdata controlled vocabulary for event types](../event-types.html), using the `additionalType` property.

In addition to concepts from the Artsdata controlled vocabulary, Artsdata accepts Schema.org Event sub-types as well as Wikidata concepts as additional types.

## Minimal requirements for minting Artsdata IDs for Events

In order for Artsdata to automatically create a unique persistent ID for an event, the event must minimally have these attribute-value pairs:

- `@Type`: `Event` (or an Event sub-type);
- `startTime`: `dateTime` value in ISO standard 8601 format (with or without a time zone offset);
- `location`: `Place` object with a complete address and a `sameAs` link to a Wikidata or Artsdata URI identifying the Place ojbect.

In the absence of a `location.sameAs` URI, Artsdata can use the `location.address.postalCode` to recognize the shape of a Place object. This process makes it possible automatically match the shape to an Artsdata URI, and then to mint Artsdata IDs to event held in this Place. Similarly, the Place's postal code is very useful to identify potential duplicate event records.

If an Event object does not fully meet these requirements, it may still possible to manually assign an ID, as long as at least one of the following properties is used:
- `name`;
- `description`;
- `url`.
