---
title: iCal Server
layout: architecture-doc
---

Artsdata's iCal Server makes it possible to configure a custom iCal feed and to import Artsdata events into any calendar application supporting the iCal standard (ex., Google Calendar, Outlook, and many website plugins).

The iCal feed is serialized following the [RFC 5545](https://datatracker.ietf.org/doc/html/rfc5545) specification. The [`DATE-TIME`](https://www.kanzaki.com/docs/ical/dateTime.html) value is serialized with local time zone and time zone reference. The npm package used to add the VTIMEZONE component is [timezones-ical-library](https://tz.add-to-calendar-technology.com/).

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
BEGIN:VTIMEZONE
TZID:America/Toronto
X-LIC-LOCATION:America/Toronto
LAST-MODIFIED:20250101T220159Z
X-LIC-LOCATION:America/Toronto
BEGIN:DAYLIGHT
TZNAME:EDT
TZOFFSETFROM:-0500
TZOFFSETTO:-0400
DTSTART:19700308T020000
RRULE:FREQ=YEARLY;BYMONTH=3;BYDAY=2SU
END:DAYLIGHT
BEGIN:STANDARD
TZNAME:EST
TZOFFSETFROM:-0400
TZOFFSETTO:-0500
DTSTART:19701101T020000
RRULE:FREQ=YEARLY;BYMONTH=11;BYDAY=1SU
END:STANDARD
END:VTIMEZONE
TIMEZONE-ID:America/Toronto
X-WR-TIMEZONE:America/Toronto
BEGIN:VEVENT
UID:31dbda94d58362aefded6ff3f0c90f1372e2153fcb9cf9962f173534b19b3b34
SEQUENCE:0
DTSTAMP:20250509T163118
DTSTART;TZID=America/Toronto:20250510T200000
DTEND;TZID=America/Toronto:20250510T210000
SUMMARY:Ivan Boivin-Flamand
LOCATION:Espace Carole-Guérin\, 725 Bd Ducharme\, La Tuque\, QC\, G9X 3B4
 \, CA
DESCRIPTION:IBF Ivan Boivin Flamand Ivan Boivin Flamand est un auteur-comp
 ositeur interprète et guitariste virtuose originaire de la Première Nati
 on atikamekw de Manawan. Dans les dernières années\, il s’est démarqu
 é par sa présence sur scène flamboyante aux côtés de Florent Vollant\
 , Scott-Pien Picard\, Maten et PAKO\, ou encore Samian au Gala ADISQ 2022.
  Son énergie contagieuse sur scène et ses solos de guitares épiques son
 t acclamées par le public. Il est considéré comme une étoile montante 
 et un modèle pour les jeunes des communautés autochtones. Ivan Boivin-Fl
 amand lance maintenant son projet solo avec un premier EP Indie-Pop Rock e
 n anglais\, à paraître en mars 2024. \n\nSpectacle de la série DÉCOUVE
 RTE de la programmation 2024-2025 !\n \n <em>Mon Complexe a des étoiles d
 ans les yeux depuis 25 ans ! #JYSERAI... et vous ?</em>
URL;VALUE=URI:https://www.ovation.ca/00001Q/fr/Event/?eventId=1L00LU
END:VEVENT
END:VCALENDAR
```
