---
title: Event Structured Data Templates
layout: gabarits-doc
---

Structured Data Templates
=====================================

Structured data templates in JSON-LD format based on the Schema.org vocabulary.

Inspired by the Structured Data Templates project of [La danse sur les routes du Québec](https://github.com/a10s-ca/ladsr-ds/blob/main/README.md)

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
Enter a URI constituting a unique identifier of the event within the website domain. The event's URI should be different from the web page's URI, because a "real-world object" and the web page describing it are two distinct [things](https://schema.org/Thing) (or _entities_) in Schema structured data.

For series of performances, in addition to the URI of the _EventSeries_ entity, a distinct URI should be assigned to each performance using the [Add-on for Event Series](https://github.com/culturecreates/artsdata-data-model/blob/master/_gabarits-jsonld/Event/event_series.jsonld). Make sure that no individual performance is assigned the same URI as the first-level _EventSeries_ entity.

For festivals, it is recommended to assign each individual event a unique URI if they are all listed on the same webpage.

If you are unable to assign a distinct URI to each event, including each performance of a series of performances, then it is preferable not to use the _@id_ property.[^2]

[^2]:It is possible to generate a  fonctional URI by appending a hash (`#`) at the end of the web page URL, followed by a string of characters that acts as a unique identifier for an event entity on the page (this string is called a [_fragment identifier_]([https://fr.wikipedia.org/wiki/Identificateur_de_fragment](https://en.wikipedia.org/wiki/URI_fragment)). Let's take this fictional example: `https://mypresentingorg.ca/events/eventname/#e1324`. In this exemple, the web page's URL (and URI) is `https://mypresentingorg.ca/events/eventname/`, while the string `e1324` is an identifier that uniquely identifies an event in the websites events listing. Any character string is fine, as long as it is unique within the website's domain. For example, it could be a local identifier in the website's database. It could also be the date and time of the performance. It is not necessary for the fragment identifier to point to a tail anchor within the page's body (for example, an `id` or `name` attribute): as long as the character string that follows the hash is unique, this satisfies the requirement of a canonical URL in the context of Schema.org. [More information](https://www.w3.org/TR/cooluris/).

### [_additionalType_](https://schema.org/additionalType)
Enter additional types corresponding to the particular type of event. Refer to the [Artsdata controlled vocabulary](http://kg.artsdata.ca/resource/ArtsdataEventTypes) to identify the most appropriate type(s) of all performing arts event types. You can add as many _additionalType_ properties as needed to properly describe the event. As a default, we recommend the type [PerformingArtsEvent](http://kg.artsdata.ca/resource/PerformingArtsEvent), which denotes "a performing arts work performed for an audience".

### [_name_](https://schema.org/name)
Enter a title by which the event is most likely to be searched and recognized. This could be the same value as the name of the main artist (_performer.name_) and/or the name of the show (_workPerformed.name_), depending on the popularity of each. Try not to exceed a length of 60 characters (for full display in results pages and calendars). Do not add any other information (such as location or date). Instead, enter this information using the appropriate properties. 

For festival editions, include the year in the title, and for festival days, include the date or numbered day (e.g. Day 1). Do not append a separator with the name of the venue (as you would for a webpage's "title" tag) or any other extraneous information.

### [_startDate_](https://schema.org/startDate)
Enter the date and time when the event begins, in [ISO 8601 date format](https://en.wikipedia.org/wiki/ISO_8601).

If possible, specify the timezone, including the number of hours offset from Coordinated Universal Time (UTC): https://nrc.canada.ca/en/web-clock/ . If you are not able to enter a timezone, then it is preferable not to enter any timezone value at all, rather than entering a dummy value (such as `+00:00`) or a default value that would not take into account changes between Standard and Daylight Savings Time. If no timezone value is specified, the time is assumed to be in local time.
- Tip: Timezone information is sometimes inherited from a website's general settings. If your timezone value appears as `+00:00`, but you did not populate this value yourself, check your website's settings.

If the event start time is unknown, or if the event is a full-day event, do not enter a time value or a time zone value.

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

### [_location_](https://schema.org/location)
Enter the information identifying and describing the place where the event is presented (is happening). The entity _nested_ under the _location_ property can be @type [Place](https://schema.org/Place) (a physical space) or @type [VirtualLocation](https://schema.org/VirtualLocation) (an online space).
In the case of a physical space: 
- The value should be as precise as possible (for example, the performance hall inside the building instead of the building itself).
- For disambiguation and reconciliation purposes, it is strongly recommended to assign a sameAs link to the place's Wikidata or Artsdata URI.
- Google requires the _address_ property with nested _PostalAddress_ entity. As a matter of fact, a complete PostalAddress entity, including the postal code, can help with disambiguation.

For festivals, if the festival day and/or festival edition occurs in multiple venues across a locality (i.e. a town, city or region), it is recommended to use the _location.address_ property without the _postalCode_ and _streetAddress_ subproperties.

### [_offers_](https://schema.org/offers)
Enter at least one _Offer_ or _AggregateOffer_ type entity, including the URL of the event's ticketing page.  For more information about how to describe _Offer_ type entities, consult [Google's documentation](https://developers.google.com/search/docs/appearance/structured-data/event#structured-data-type-definitions)

### [_doorTime_](https://schema.org/doorTime)

For festivals, enter the time that admission to the festival day and/or festival edition begins, in ISO 8601 format. This property is intended to be used when the doorTime is different from the startTime of the first event within the festival schedule.

### [_sameAs_](https://schema.org/sameAs) _(for embeded entities)_
Enter the URIs of _bridge identifiers_[^3] that identify without any ambiguity the entities nested within the _Event_ type entity. When there are multiple values, list them within square brackets, one URI per line.

[^3]: A __bridge identifier__ is a globally unique _persistent identifier_ (i.e., an identifier expressed as a permanent and dereferenceable URI) that is used by several information systems and can thus help reconcile entities across systems. Bridge identifier therefore play a crucial role in enabling data sharing across systems. The ISNI, the Wikidata ID and the Artsdata ID are relevant bridge identifiers in the performing arts domain. The URIs of these bridge identifiers can resolve to either a web page (readable by humans) or RDF data (readable by machines) that provide descriptive information about the entity. For more information, consult these [Recommendations Regarding Unique Persistent Identifiers in the Performing Arts](https://docs.google.com/spreadsheets/d/1j2Be-KBZm4LioW3DH2NU7GR3m77boTeQcIHZe8OMK3U/edit?usp=sharing).

Always enter bridge identifiers in full URI format (rather than entering just the identifier's string). For example, for the Wikidata ID `Q596774`, the matching URI is http://www.wikidata.org/entity/Q596774 (note that the URI format is different from the web page URL format). ISNI, Wikidata and Artsdata all have their own user interface with their respective processes for searching an entity and retrieving its URI. Wikidata is particularly intricate in this regard: in order to retrieve an item's URI, the user must right click on "Concept URI" in the left menu (within the "Tools" section), and then select "Copy link address". For more information, consult these [Recommendations Regarding Unique Persistent Identifiers in the Performing Arts](https://docs.google.com/spreadsheets/d/1j2Be-KBZm4LioW3DH2NU7GR3m77boTeQcIHZe8OMK3U/edit?usp=sharing).

The _sameAs_ property can also be used to list social media and streaming platform accounts associated with an entity.

Here is a JSON-LD example of a nested @type [Person](https://schema.org/Person)Person entity described with the _sameAs_ property. Please note that, for consision's sake, several relevant properties were excluded from this example.

```
{
   "@context":"http://schema.org/",
   "@type":"Event",
   "@id":"https://somesite.ca/events/elisapie-isaac#2023-06-16T20:00:00",
   "name":"The Ballad of the Runaway Girl",
   "startDate":"2023-06-16T20:00:00-04:00",
   <!-- ... -->
   "performer":{
      "@type":"Person",
      "name":"Elisapie",
      "url":"https://www.elisapie.com",
      "sameAs":[
         "http://kg.artsdata.ca/resource/K12-438",
         "https://isni.org/isni/0000000002492038",
         "http://www.wikidata.org/entity/Q596774",
         "https://music.apple.com/artist/440813872"]
      },
   <!-- ... -->
}
```
