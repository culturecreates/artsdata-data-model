---
title: Event Structured Data Templates
layout: gabarits-doc
---


Event Structured Data Templates
=====================================

Structured data templates in JSON-LD format based on the Schema.org vocabulary.

## Conventions

### Identification of values to modify in the templates

Templates are made available as a file containing data in JSON-LD format.

To facilitate understanding and use, explanatory notes have been included about the expected values and the format in which they should be entered. These notes have been placed between double dashes in French and in English. For example:

```
"url": "--URL complète vers la page Web concernée : Full URL to the relevant webpage--"
```

Once the template is used and filled with data, it should no longer contain double dashes. For instance:

```
"url": "https://placedesarts.com"
```

## Templates

The _Event_ template is intended to represent information about single events, ie a show having a single representation. If your event has a series of performances of the same show, please *add* the _Event Series_ template to the _Event_ template to describe each individual performance as a _nested entity_[^1] within the ['subEvent'](https://schema.org/subEvent) property's array. Then change the top _Event_ type to ['EventSeries'](https://schema.org/EventSeries).

[^1]: The term __"nested entities"__ refers to entities linked to the _Event_ entity through properties such as _organizer_, _performer_, _location_ ou _subEvent_. These entities are [things](https://schema.org/Thing) in their own right in the Schema.org context. They can have a different _@type_ from the first-level entity. They can be described with attribute-value pairs in the same fashion as the first-level entity. The "nesting" of entities within the first-level entity serves many purposes: it indicates that the first-level entity is the main entity of the web page; it explicitly and semantically describes the relationship between the first-level entity and the second-level entities; it removes any confusion as to which attribute-value pair relates to which entity. Nested entities are embedded as values within an attribute-value pair using curly brackets `{ }`. Nested entities are usually indented in the code and in JSON-LD viewers, in order to help human readability.

- [Event template](https://github.com/culturecreates/artsdata-data-model/blob/master/_gabarits-jsonld/Event/event.jsonld) - single events

- [Add-on for Event Series](https://github.com/culturecreates/artsdata-data-model/blob/master/_gabarits-jsonld/Event/event_series.jsonld) - add-on to Event template to include a series of performances of the same show

For festivals, you can use one or more of the following templates to describe the festival edition as a whole, specific days within the festival, and/or individual events within the festival:

- [Festival templates](https://docs.google.com/document/d/1YyXX0xcYxzbzKvgvO8y0_lKC_LoQmbgn9oXC5X6t1Zs/edit?usp=sharing) - Festival Edition, Festival Day and Individual Event

Please note that the festival templates are intended to represent information about the specific edition of a festival, for example [Prismatic 2023](https://prismaticfestival.com/index.php/prismatic-2023/) (equivalent to [ado:Festival](http://kg.artsdata.ca/resource/Festival) and [wd:Q27968043](https://www.wikidata.org/wiki/Q27968043)). They are not intended to represent information about the festival as a recurring event (equivalent to [wd:Q132241](https://www.wikidata.org/wiki/Q132241)) or as an organization (equivalent to [ado:FestivalOrganization](http://kg.artsdata.ca/resource/FestivalOrganization) and [wd:Q108669279](http://www.wikidata.org/entity/Q108669279)). For additional clarity on these different but related concepts, please consult [WikiProject Cultural events](https://www.wikidata.org/wiki/Wikidata:WikiProject_Cultural_events/Data_structure).


## Details on key properties

### _@id_
Enter a URI constituting a unique [persistent identifier](https://culturecreates.github.io/artsdata-data-model/identifier-recommendations.html) of the event within the website domain. The event's URI should be different from the web page's URI, because a "real-world object" and the web page describing it are two distinct [things](https://schema.org/Thing) (or _entities_) in Schema structured data.

For series of performances, in addition to the URI of the _EventSeries_ entity, a distinct URI should be assigned to each performance using the [Add-on for Event Series](https://github.com/culturecreates/artsdata-data-model/blob/master/_gabarits-jsonld/Event/event_series.jsonld). Make sure that no individual performance is assigned the same URI as the first-level _EventSeries_ entity.

For festivals, it is recommended to assign each individual event a unique URI if they are all listed on the same webpage.

If you are unable to assign a distinct URI to each event, including each performance of a series of performances, then it is preferable not to use the _@id_ property.

[Read more about the @id property and local URIs](https://culturecreates.github.io/artsdata-data-model/id-and-uri-guidelines.html)

### [_additionalType_](https://schema.org/additionalType)
Enter additional types corresponding to the particular type of event. Refer to the [Artsdata controlled vocabulary](https://culturecreates.github.io/artsdata-data-model/event-types.html) to identify the most appropriate type(s) of all performing arts event types. You can add as many _additionalType_ properties as needed to properly describe the event. As a default, we recommend the type [PerformingArtsEvent](http://kg.artsdata.ca/resource/PerformingArtsEvent), which denotes "a performing arts work performed for an audience".

### [_name_](https://schema.org/name)
Enter a title by which the event is most likely to be searched and recognized. This could be the same value as the name of the main artist (_performer.name_) and/or the name of the show (_workPerformed.name_), depending on the popularity of each. Try not to exceed a length of 60 characters (for full display in results pages and calendars). Do not add any other information (such as location or date). Instead, enter this information using the appropriate properties. 

For festival editions, include the year in the title, and for festival days, include the date or numbered day (e.g. Day 1).

### [_startDate_](https://schema.org/startDate)
Enter the date and time when the event begins, in [ISO 8601 date format](https://en.wikipedia.org/wiki/ISO_8601).

If possible, specify the timezone, including the number of hours offset from Coordinated Universal Time (UTC): https://nrc.canada.ca/en/web-clock/ . If you are not able to enter a timezone, then it is preferable not to enter any timezone value at all, rather than entering a dummy value (such as `+00:00`) or a default value that would not take into account changes between Standard and Daylight Savings Time. If no timezone value is specified, the time is assumed to be in local time.
- Tip: Timezone information is sometimes inherited from a website's general settings. If your timezone value appears as `+00:00`, but you did not populate this value yourself, check your website's settings.

If the event start time is unknown, or if the event is a full-day event, do not enter a time value or a time zone value.

### [_location_](https://schema.org/location)
Enter the information identifying and describing the place where the event is presented (is happening). The entity _nested_ under the _location_ property can be @type [Place](https://schema.org/Place) (a physical space) or @type [VirtualLocation](https://schema.org/VirtualLocation) (an online space).
In the case of a physical space: 
- The value should be as precise as possible (for example, the performance hall inside the building instead of the building itself).
- For disambiguation and reconciliation purposes, it is strongly recommended to assign a sameAs link to the place's Wikidata or Artsdata URI.
- Google requires the _address_ property with nested _PostalAddress_ entity. As a matter of fact, a complete PostalAddress entity, including the postal code, can help with disambiguation.
- For a _PostalAddress_ entity, it is better to use the two-letter postal abbreviations for _addressRegion_ and _addressCountry_ values.

For festivals, if the festival day and/or festival edition occurs in multiple venues across a locality (i.e. a town, city or region), it is recommended to use the _location.address_ property without the _postalCode_ and _streetAddress_ subproperties.

### [_url_](https://schema.org/url)
Enter the canonic URL (i.e. "official URL") of the event web page on the organizer's website. 

For series of performances, if each peformance has its own web page, enter each performance's unique URL. Otherwise, enter the URL of the event series' web page.

For festivals, if the festival edition or an individual festival event is described on multiple pages (for example, the home page, the full schedule page, and the day-to-day page), choose one page URL as the canonical URL and enter this same URL value in the structured data of each page.

### [_eventStatus_](https://schema.org/eventStatus)
Indicate whether an event is [scheduled](https://schema.org/EventScheduled) (with date), [postponed](https://schema.org/EventPostponed) (date to be confirmed), [rescheduled](https://schema.org/EventRescheduled) (with new date) or [cancelled](https://schema.org/EventCancelled).

### [_eventAttendanceMode_](https://schema.org/eventAttendanceMode)
Indicate if an event occurs [in person](https://schema.org/OfflineEventAttendanceMode), [online](https://schema.org/OnlineEventAttendanceMode), or is [hybrid](https://schema.org/MixedEventAttendanceMode), meaning both on and offline.

### [_organizer_](https://schema.org/organizer)
Enter information identifying and describing the organization that is responsible for presenting the show or festival. It can be a presenting organization or a company self-presenting its own production (in which case, the same value would be entered under the performer property). You can add multiple _organizer(s)_. Entities _nested_[^1] under this property are typically of @type [Organization](https://schema.org/Organization). Recommended properties for the nested entity include: _name_, _url_, and _sameAs_ (with link pointing to a Wikidata or Artsdata URI).

### [_performer_](https://schema.org/performer)
Enter information identifying and describing the company, group or person(s) who is(are) responsible for performing the performance. It is possible to add several _performer(s)_. The entities _nested_ under this property can be of @type [Organization](https://schema.org/Organization), [PerformingGroup](https://schema.org/PerformingGroup) or [Person](https://schema.org/Person). Recommended properties for the nested entity include: _name_, _url_, and _sameAs_ (with link pointing to an ISNI, Wikidata or Artsdata URI).

### [_offers_](https://schema.org/offers)
Enter at least one _Offer_ or _AggregateOffer_ type entity, including the URL of the event's ticketing page.  For more information about how to describe _Offer_ type entities, consult [Google's documentation](https://developers.google.com/search/docs/appearance/structured-data/event#structured-data-type-definitions).

### [_doorTime_](https://schema.org/doorTime)

For festivals, enter the time that admission to the festival day and/or festival edition begins, in ISO 8601 format. This property is intended to be used when the doorTime is different from the startTime of the first event within the festival schedule.

### [_sameAs_](https://schema.org/sameAs)
Enter the URIs of [persistent identifiers](https://culturecreates.github.io/artsdata-data-model/identifier-recommendations.html) that identify without any ambiguity the event and/or the entities nested within the _Event_ type entity. When there are multiple values, list them within square brackets, one URI per line.

[Read more about the sameAs property](https://culturecreates.github.io/artsdata-data-model/sameas-guidelines)
