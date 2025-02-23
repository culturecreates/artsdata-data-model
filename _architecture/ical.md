---
title: iCal Server
layout: architecture-doc
---

Artsdata's iCal Server makes it possible to configure a custom iCal feed and to import Artsdata events into any calendar application supporting the iCal standard (ex., Google Calendar, Outlook, and many website plugins).

The iCal feed is serialized following the [RFC 5545](https://datatracker.ietf.org/doc/html/rfc5545) specification. The [`DATE-TIME`](https://www.kanzaki.com/docs/ical/dateTime.html) value is serialized in form #3:date with local time zone and time zone reference.

Support for later specifications could be provided, as needed.

## How to create an iCal Feed

To create a new iCal Feed, add a CONSTRUCT SPARQL to the artsdata-stewards <a href='https://github.com/artsdata-stewards/artsdata-actions/tree/main/ical'>iCal Github repository</a>. Your CONSTRUCT SPARQL will automatically appear in the list of iCal Feeds.

To share an iCal Feed: 
1. Go to [Artsdata.ca](http://kg.artsdata.ca).
2. Sign-in with any Github account.
3. Navigate to the "iCal Feeds" using the menu (top-right).
4. Click the copy icon of the iCal Feed you wish to share.

The iCal Feed URL can be used with any iCal/ICS tool of your choice. To test an iCal Feed, copy the iCal Feed URL and paste it into this free Wordpress calendar plugin: <a href='https://icscalendar.com/preview/'>ICS Calendar</a>.</p>

## CONSTRUCT SPARQL requirements
The CONSTRUCT SPARQL must have the following minimum data in order to work with the Artsdata iCal server:

Events of type `schema:Event` with properties:
```
schema:name
schema:startDate
schema:endDate
schema:location
schema:description
schema:url
```

Nested location of type `schema:Place` with properties:
```
schema:name
schema:address
```

Nested address of type `schema:PostalAddress` with properties:
```
schema:streetAddress
schema:addressRegion
schema:addressCountry
schema:postalCode
schema:addressLocality
```

## Examples

You can find sample CONSTRUCT SPARQL at [https://kg.artsdata.ca/ical](https://kg.artsdata.ca/ical)

### Sample server response

_TO BE ADDED AFTER FORM 3 DATE-TIME IS IMPLEMENTED._
