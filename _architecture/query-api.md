---
title: Search API
layout: architecture-doc
---

A RESTful API to query anything in Artsdata including events, people, places, organizations and vocabularies...

### Examples

#### Any Artsdata ID: K2-197
https://api.artsdata.ca/query?adid=K2-197&format=json&sparql=query_adid

#### Place: Cabaret La Basoche
http://api.artsdata.ca/query?adid=K5-7&format=json&frame=ranked_place_footlight&sparql=ranked_place_footlight

#### Person: Étienne Coppée
http://api.artsdata.ca/query?adid=K5-21&format=json&frame=ranked_org_person_footlight&sparql=ranked_org_person_footlight

#### Organization: Société de musique de chambre de Gatineau
https://api.artsdata.ca/query?adid=K5-3&format=json&frame=ranked_org_person_footlight&sparql=ranked_org_person_footlight



## Event Search API BETA

The Event Search API is a dedicated endpoint for events and provides an easy way to get a list of events in json or json-ld. The "frame" parameter enables the user to select different output properties and structures. The "format" parameter selects between json and json-ld. And the "source" parameter selects the graph or calatog of graphs. Documentation WIP.

Example: List of upcoming events from the placedesarts.com website in Montreal: 
http://api.artsdata.ca/events?format=json&frame=event_bn&source=http://kg.artsdata.ca/culture-creates/footlight/placedesarts-com

### Source parameter
Many different datasets are uploaded to Artsdata daily. The Event API allows you to specific the source of your dataset by passing a dataset URI or a catalog of datasets URI.

Here is a list of [graphs](https://kg.artsdata.ca/query/show?sparql=feeds_all&title=Data+Feeds) that can be used as the source parameter.

It is possible to create your own catalog of datasets as well.

### Events demo

Here is a [demo website in Github](https://github.com/culturecreates/artsdata-demo-upcoming-events-api) that lists upcoming events in Quebec using the Artsdata API.


## Other APIs coming soon
The main goal of the Search API is to provide easy access to all data in Artsdata.ca. It offers SPARQL and traditional RESTful GETs.
Responses can be in JSON or JSON-LD.  A user account enables persisted configurations for ranking graphs or settings for an iCalendar feed. 

Documentation coming.
