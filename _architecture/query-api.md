---
title: Search API
layout: architecture-doc
---

A RESTful API to query anything in Artsdata. 

### Examples

#### Place: Cabaret La Basoche
http://api.artsdata.ca/query?adid=K5-7&format=json&frame=ranked_place_footlight&sparql=ranked_place_footlight

#### Person: Étienne Coppée
http://api.artsdata.ca/query?adid=K5-21&format=json&frame=ranked_org_person_footlight&sparql=ranked_org_person_footlight

#### Organization: Société de musique de chambre de Gatineau
https://api.artsdata.ca/query?adid=K5-3&format=json&frame=ranked_org_person_footlight&sparql=ranked_org_person_footlight

#### Events: Co-motion
http://api.artsdata.ca/query?limit=100&sparql=query_footlight_events&frame=event_footlight&format=json&source=http://kg.artsdata.ca/culture-creates/footlight/co-motion-ca




## Event Search API BETA

The Event Search API is an alternate endpoint to the general search API and provides an easy way to get a list of events in json or json-ld. The "frame" parameter enables the user to select different output properties and structures. The "format" parameter selects between json and json-ld. And the "source" parameter selects the graph or calatog of graphs. Documentation WIP.

Example: List of upcoming events from the OSM website in Montreal: 
http://api.artsdata.ca/events?format=json&frame=event_bn&source=http://kg.artsdata.ca/culture-creates/capacitor/Osm

### Source parameter
Many different datasets are uploaded to Artsdata daily. The Event API allows you to specific the source of your dataset by passing a dataset URI or a catalog of datasets URI.

Here is a list of [individual datasets](https://s.zazuko.com/2owq14) that can be used as the source parameter. And here is a list of [catalogs of datasets]( https://s.zazuko.com/5hG5Cc) that can also be used as the source parameter.

It is possible to create your own catalog of datasets as well.

### Events demo

Here is a [demo website in Github](https://github.com/culturecreates/artsdata-demo-upcoming-events-api) that lists upcoming events in Quebec using the Artsdata API.


## Other APIs coming soon
The main goal of the Search API is to provide easy access to all data in Artsdata.ca. It offers SPARQL and traditional RESTful GETs.
Responses can be in JSON or JSON-LD.  A user account enables persisted configurations for ranking graphs or settings for an iCalendar feed. 

Documentation coming.
