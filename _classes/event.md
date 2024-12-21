---
class_name: Event
layout: class-doc
---

## Event Types

The [Artsdata controlled vocabulary]({{ base }}/eventtype.html)  for event types.

## Minting Artsdata IDs for Events

In order for Artsdata to automatically create a unique ID for a performing arts event, the event must minimally have these three attribute–value pairs:

- @Type: Event (or an Event sub-type);
- startTime: dateTime value with a time zone offset;
- location: Place with a sameAs link to a Wikidata or Artsdata URI.

If the startTime value is incomplete or if the Place entity does not have a sameAs link to an identifier, it is still possible to manually assign an ID, as long as at least one of the following properties is used:
- name;
- description;
- url.

In the absence of a Place URI, a postal code can be useful to identify potential duplicate event records.
