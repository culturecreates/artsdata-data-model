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

```
BEGIN:VCALENDAR
VERSION:2.0
PRODID:-//sebbo.net//ical-generator//EN
NAME:artsdata-ical
X-WR-CALNAME:artsdata-ical
BEGIN:VEVENT
UID:b3ba75da0bf967b69ab277e745d4e68f471ccc5a70b27b4c1892de7a6c79612d
SEQUENCE:0
DTSTAMP:20250506T050140Z
DTSTART:20250512T200000
DTEND:20250512T210000
SUMMARY:Susan Aglukark: This Child 30th Anniversary Tour
LOCATION:Labrador West Arts & Culture Centre\, 300 Hudson Drive\, Labrador
  City\, NL\, Labrador City\, NL\, A2V 2K3\, CA
DESCRIPTION:Susan Aglukark is Canada’s first Inuk artist to win a Juno (
 4)\, a Governor General’s Performing Arts Award for lifetime artistic ac
 hievement\, and she is an officer of the Order of Canada. Susan holds seve
 ral Honourary Doctorate degrees and has held command performances. Her jou
 rney as a singer-songwriter began in the early 1990’s when she began her
  writing and recording career. In Susan’s early reflections was the disc
 overy of the platform as learning\, sharing and healing\, this inspired he
 r major label debut album This Child\, released in January 1995. She has s
 ince written and recorded 10 albums\, founded the Arctic Rose Foundation\,
  authored two children’s books and has a personal memoir in the works. H
 er writing of This Child brought her to a personal call to action\, get on
  the platform and speak up\, learn\, heal\, share\, this has been her work
  for these 30 years. Join us to celebrate 30 years of this amazing album w
 ith one of Canadia’s premier talents.
URL;VALUE=URI:https://www.artsandculturecentre.com/labwest/Online/default.
 asp?doWork::WScontent::loadArticle=Load&BOparam::WScontent::loadArticle::a
 rticle_id=E51A1A5E-1E2B-4444-8C82-1DFD5E08E1A8
END:VEVENT
END:VCALENDAR
```
