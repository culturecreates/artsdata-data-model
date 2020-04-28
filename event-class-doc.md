---
layout: page
title: "Event Class Documentation"
---

# Event - [http://schema.org/Event](http://schema.org/Event)

Thing > Event




An event happening at a certain time and location, such as a concert, lecture, or festival. Ticketing information may be added via the offers property. Repeated events may be structured as separate Event objects.

* [Open Issues](#)
* [Leave Feedback](#)



## Properties

Property | Expected Type | Description | From Class
:--- | :--- | :--- | :---
location | Place |	The location of for example where the event is happening, an organization is located, or where an action takes place. |	Event
offers	| Offer | An offer to provide this item—for example, an offer to sell a product, rent the DVD of a movie, perform a service, or give away tickets to an event. Use businessFunction to indicate the kind of transaction offered, i.e. sell, lease, etc. This property can also be used to describe a Demand. While this property is listed as expected on a number of common types, it can be used in others. In that case, using a second type, such as Product or a subtype of Product, can clarify the nature of the offer.|	Event
startDate	|  DateTime | The start date and time of the item (in ISO 8601 date format).	| Event
endDate	|  DateTime |  The end date and time of the item (in ISO 8601 date format).	| Event
superEvent	| Event | An event that this event is a part of. For example, a collection of individual music performances might each have a music festival as their superEvent.	| Event
performer	| Person or Organization | A performer at the event—for example, a presenter, musician, musical group or actor.	| Event
duration | Duration	| The duration of the item (movie, audio recording, event, etc.) in ISO 8601 date format. |	Event
eventStatus | EventStatusType |	An eventStatus of an event represents its status; particularly useful when an event is cancelled or rescheduled.|	Event
organizer | Person or Organization	|An organizer of an Event.	| Event
name | Text | The name of the item. |	Thing
url |	URL | URL of the item.|	Thing
description | Text | 	A description of the item.|	Thing
image	| URL | An image of the item. This can be a URL or a fully described ImageObject.|	Thing
sameAs |	URL | URL of a reference Web page that unambiguously indicates the item's identity. E.g. the URL of the item's Wikipedia page, Wikidata entry, or official website. |	Thing
alternateName	An alias for the item.	| Thing


### More Specific Types

### Examples

