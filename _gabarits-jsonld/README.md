---
title: Structured Data Templates
layout: gabarits-doc
---

Structured Data Templates
=====================================

Structured data templates in JSON-LD format based on the Schema.org vocabulary.

Inspired by the Structured Data Templates project of [La danse sur les routes du Québec](https://github.com/a10s-ca/ladsr-ds/blob/main/README.md)

## Conventions

### Identification of values to modify in the template

Templates are made available as a file containing data in JSON-LD format.

To facilitate understanding and use, explanatory notes have been included about the expected values and the format in which they should be entered. These notes have been placed between double dashes in French and in English. For example:

```
"url": "--URL complète vers la page Web concernée : Full URL to the relevant webpage--"
```

Once the template is used and filled with data, it should no longer contain double dashes. For instance:

```
"url": "https://placedesarts.com"
```

## Template

The _Event_ template is intended to represent information about single events, ie a show having a single representation. If your event has a series of performances of the same show, please *add* the _Event Series_ template to the _Event_ template to describe each individual performance as a _nested entity_[^1] with the ['subEvent'](https://schema.org/subEvent) property, and then change the top _Event_ type to ['EventSeries'](https://schema.org/EventSeries).

[^1]: The term __"nested entities"__ refers to entities linked to the _Event_ entity through properties such as _organizer_, _performer_, _location_ ou _subEvent_. These entities are [things](https://schema.org/Thing) in their own right in the Schema.org context. They can have a different _@type_ from the first-level entity. They can be described with attribute-value pairs in the same fashion as the first-level entity. The "nesting" of entities within the first-level entity (using curly brackets `{ }`) serves many purposes: it indicates that the first-level entity is the main entity of the page; it explicitly and semantically describes the relationship between the first-level entity and the second-level entities; it removes any confusion as to which attribute-value pair relates to which entity. Nested entities are usually indented in the code and in JSON-LD viewers, in order to provide visual cues to human readers.

- [Event template](https://github.com/culturecreates/artsdata-data-model/blob/master/_gabarits-jsonld/Event/event.jsonld) - single events

- [Add-on for Event Series](https://github.com/culturecreates/artsdata-data-model/blob/master/_gabarits-jsonld/Event/event_series.jsonld) - add-on to Event template to include a series of performances of the same show

## Details on key properties

### _@id_
Enter a URI constituting a unique identifier of the event within the website domain. The event's URI should be different from the web page's URI, since these are two distinct [things](https://schema.org/Thing) (or _entities_) in Schema structured data.

### [_additionalType_](https://schema.org/additionalType)
Enter additional types corresponding to the particular type of event. Refer to the [Artsdata controlled vocabulary](http://kg.artsdata.ca/resource/ArtsdataEventTypes) to identify the most appropriate type(s) of all performing arts event types. You can add as many _additionalType_ properties as needed to properly describe the event. As a default, we recommend the type [PerformingArtsEvent](http://kg.artsdata.ca/resource/PerformingArtsEvent), which denotes « a performing arts work performed for an audience ».

### [_name_](https://schema.org/name)
Enter the title of the event.

### [_url_](https://schema.org/url)
Enter the URL of the event webpage on the organizer's website. 
For series of performances, in addition to the URL of the series webpage, a distinct URL should be assigned to each performance using the [Add-on for Event Series](https://github.com/culturecreates/artsdata-data-model/blob/master/_gabarits-jsonld/Event/event_series.jsonld). If individual performances in the series do not have their own stand-alone webpages, unique URLs can be created by appending # anchors followed by the date of each performance.

### [_eventStatus_](https://schema.org/eventStatus)
Indicate whether an event is [scheduled](https://schema.org/EventScheduled) (with date), [postponed](https://schema.org/EventPostponed) (date to be confirmed), [rescheduled](https://schema.org/EventRescheduled) (with new date) or [cancelled](https://schema.org/EventCancelled).

### [_eventAttendanceMode_](https://schema.org/eventAttendanceMode)
Indicate if an event occurs [in person](https://schema.org/OfflineEventAttendanceMode), [online](https://schema.org/OnlineEventAttendanceMode), or is [hybrid](https://schema.org/MixedEventAttendanceMode), meaning both on and offline.

### [_organizer_](https://schema.org/organizer)
Enter information identifying and describing the organization that is responsible for presenting the show. It can be a presenter or a self-presenting company. You can add multiple _organizer(s)_. Entities _nested_[^1] under this property are typically of @type [Organization](https://schema.org/Organization).

### [_performer_](https://schema.org/performer)
Enter information identifying and describing the company, group or person(s) who is(are) responsible for performing the performance. It is possible to add several _performer(s)_. The entities _nested_ under this property can be of @type [Organization](https://schema.org/Organization), [PerformingGroup](https://schema.org/PerformingGroup) or [Person](https://schema.org/Person). 

### [_location_](https://schema.org/location)
Enter the information identifying and describing the place where the event is presented (is happening). The entity _nested_ under the _location_ property can be @type [Place](https://schema.org/Place) (a physical space) or @type [VirtualLocation](https://schema.org/VirtualLocation) (a virtural space).

### [_offers_](https://schema.org/offers)
Enter information about ticket availability and the webpage where tickets can be purchased.






