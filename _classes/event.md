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
- `location`: `Place` object with a _complete_ address and a [`sameAs`]({{ base }}/sameas.html) link to a Wikidata or Artsdata URI identifying the Place object.

In the absence of a `location.sameAs` URI, Artsdata may be able to use `location.name`, `location.address.locality`, and/or `location.address.postalCode` to automatically or manually reconcile (i.e. "recognize") Place entities and match them to their Artsdata URI. Similarly, the Place's postal code is very useful to identify potential duplicate event records, which is an important validation process taking place prior to assigning an ID to an event.

If an Event object does not fully meet these requirements, it may still possible to manually assign an ID, as long as at least one of the following properties is used:
- `name`;
- `description`;
- `url`.

## Properties

| Property | Status | Instructions |
| - | - | - |
| [startDate](http://schema.org/startDate) | Required | Enter the date and time when the event begins, in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date format. If possible, specify the time zone, including the number of hours offset from [Coordinated Universal Time (UTC)](https://nrc.canada.ca/en/web-clock/). If you are not able to enter a time zone, then it is preferable not to enter any time zone value at all, rather than entering a dummy value (such as "+00:00") or a default value that would not take into account changes between Standard and Daylight Savings Time. If no time zone value is specified, the time is assumed to be in local time. If the event start time is unknown, or if the event is a full-day event, do not enter a time value or a time zone value. |
| [location](http://schema.org/location) | Required | Enter where the event takes place. In the case of a physical venue, the value should be as precise as possible (for example, the performance hall inside the building instead of the building itself). For disambiguation and reconciliation purposes, it is strongly recommended to assign a `sameAs` link to the place's Wikidata or Artsdata URI. Otherwise, a complete `PostalAddress` entity – including the postal code and the two-letter postal abbreviations for the province/territory and country – can help with disambiguation. For more information, see these [guidelines](https://culturecreates.github.io/artsdata-data-model/location.html). |
| [name](http://schema.org/name) | Required | Enter a title by which the event is most likely to be searched and recognized. This could be the same value as the name of the main artist (`performer.name`) and/or the name of the show (`workPerformed.name`), depending on the popularity of each. Try not to exceed a length of 60 characters (for full display in results pages and calendars). Do not add any other information (such as location or date). Instead, enter this information using the appropriate properties. See also `alternateName`. |
| [additionalType](http://schema.org/additionalType) | Recommended | Enter additional types corresponding to the particular type of event. Refer to the [Artsdata controlled vocabulary](https://culturecreates.github.io/artsdata-data-model/event-types.html) to identify the most appropriate event type(s). As a default, we recommend the type [adr:PerformingArtsEvent](http://kg.artsdata.ca/resource/PerformingArtsEvent), which denotes a "performance". |
| [url](http://schema.org/url) | Recommended | Enter the canonical (aka "official") URL of the event webpage on the organizer's website. |
| [description](http://schema.org/description) | Recommended | Enter a short description of the event. Don't repeat other facts like date and location. Instead, add that information to the respective properties. |
| [image](http://schema.org/image) | Recommended | Identify the main image for the event page. This can be a URL or a fully described `ImageObject`. Recommend properties for the nested `ImageObject` include: `contentUrl`, `creator`, `copyrightNotice`, `license`. Suggested properties include: `creditText` providing proper attributions to parties associated with the image (performers, designers, production company), `caption` and `description` providing an "alt" description of the image. For more information, see the [Artsdata Image Policy](https://kg.artsdata.ca/doc/image-policy). |
| [organizer](http://schema.org/organizer) | Recommended | Enter information identifying and describing the organization or person who presents the event. For an organization, this can be a presenting organization or even a company presenting its own production (in which case, the same value would be entered under the performer property). Recommended properties for the nested entity include: `name`, `url`, and `sameAs` (with link pointing to a Wikidata or Artsdata URI). |
| [performer](http://schema.org/performer) | Recommended | Enter information identifying and describing the main company, group or artist(s) delivering the performance. Recommended properties for the nested entity include: `name`, `url`, and `sameAs` (with link pointing to an ISNI, Wikidata or Artsdata URI). For more information, see these [guidelines](https://culturecreates.github.io/artsdata-data-model/performer.html). |
| [workPerformed](http://schema.org/workPerformed) | Optional | Enter information identifying and describing the performance work performed at the event, or the musical, dramatic or music-dramatic work(s) integrated into the performance work. Recommended properties for the nested entity include: `name`, `url`, `genre`, `sameAs` (with a link pointing to a Wikidata or Artsdata URI), and inLanguage. If the work itself does not have a Wikidata or Artsdata URI, a creator nested entity may be added, stating the creator's `name` and `sameAs` (with a link pointing to a Wikidata URI). |
| [offers](http://schema.org/offers) | Recommended | Enter at least one `Offer` or `AggregateOffer` type entity, including the URL of the event's ticketing page. For more information about how to describe `Offer` type entities, consult the Artsdata event structured data template and [Google's documentation](https://developers.google.com/search/docs/appearance/structured-data/event#structured-data-type-definitions) |
| [sameAs](http://schema.org/sameAs) | Optional | Enter the URIs of persistent identifiers (ex. Artsdata) and/or social media URLs (ex. Facebook event page) that unambiguously identify the event. Always enter identifiers in full URI format (instead of entering just the ID itself). For more information, see these [guidelines](https://culturecreates.github.io/artsdata-data-model/sameas.html). |
| [inLanguage](http://schema.org/inLanguage) | Optional | Identify the main language spoken, sung and/or signed during the event. If more than one language is used extensively over the course of the event, list each language within square brackets. See also `subtitleLanguage`. |
| [endDate](http://schema.org/endDate) | Optional | Enter the date and time when the event ends, in ISO 8601 date format. Be sure to specify the time zone, including the number of hours offset from Coordinated Universal Time (UTC). |
| [duration](http://schema.org/duration) | Optional | Enter the length from the `startDate` to the `endDate` of the event, in ISO 8601 date format. |
| [eventAttendanceMode](http://schema.org/eventAttendanceMode) | Optional | Identify the manner in which audiences attend the event, such as online, offline, or mixed. For the complete list, see [`EventAttendanceModeEnumeration`](https://schema.org/EventAttendanceModeEnumeration). |
| [eventStatus](http://schema.org/eventStatus) | Optional | Identify the current programming status of the event, such as scheduled, cancelled or rescheduled. For the complete list, see [`EventStatusType`](https://schema.org/EventStatusType). |
| [alternateName](http://schema.org/alternateName) | Optional | Enter a complementary name to the value entered under `name`, which could designate a subtitle for the event. This could be the name of the show, the main artist or the company. It could also be the name of the opening act, or the name of the festival where the event takes place. Do not enter any variant(s) of the name already entered under `name`. |
| [mainEntityOfPage](http://schema.org/mainEntityOfPage) | Optional | Enter the URL of a page on another website other than organizer's that describes the same event as the canonical URL. |
| [superEvent](http://schema.org/superEvent) | Optional | If your event is part of a larger event, such as a `Festival`, enter information identifying and describing the larger event. |
| [subEvent](http://schema.org/subEvent) | Optional | If your event is an `EventSeries` and consists of a series of performances of the same performance work, please describe each performance as a nested entity under the `subEvent` property. If your event is a `Festival` and a single web page describes both the festival edition and individual performances presented at the festival, please describe each performance as a nested entity under the `subEvent` property. |
