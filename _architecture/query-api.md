---
title: Query API
layout: architecture-doc
---

The Query API offers a collection of APIs that acts as a gateway between the outside world and the Artsdata Triplestore.

## Reconciliation Service

The Artsdata.ca Reconciliation Service can be used to link entites to Artsdata.ca IDs. Supported entites include People, Organizations, and Places. In the future Performing Arts Productions and Works will be added. This API follows the documentation provided by the [W3C Entity Reconciliation Community Group](https://reconciliation-api.github.io/specs/latest/). This API can be consumed by tools like [OpenRefine](https://openrefine.org) to add Artsdata.ca IDs (for example artists) to enrich an existing spreadsheet.

API documentation: [W3C Entity Reconciliation Community Group](https://reconciliation-api.github.io/specs/latest/)

Reconciliation service endpoint: https://api.artsdata.ca/recon

Give it a try using the [Test bench](https://reconciliation-api.github.io/testbench/)! (click 'Test bench' tab and enter the endpoint). Or view this [screen recording](https://youtu.be/VkOncek9iuY).

## Preview Service

Artsdata Preview Service provides embeddable HTML previews of entities (for example artists) directly in a user interface. This API is consumed along with the Reconciliation Service, by tools like [OpenRefine](https://openrefine.org) where you can roll-over Artsdata.ca IDs (for example artists) and get a preview of information (photo, occupation, nationality, ISNI) to help with disambiguation. Documentation provided by the [W3C Entity Reconciliation Community Group](https://reconciliation-api.github.io/specs/latest/).


## Events Query API BETA

**NEW 15-SEP-2021**: The Artsdata Events Query API provides an easy way to get a list of events in json or json-ld. The "frame" parameter enables the user to select different output properties and structures. The "format" parameter selects between json and json-ld. And the "source" parameter selects the graph or calatog of graphs. Documentation WIP.

Example: List of upcoming events from the OSM website in Montreal: http://api.artsdata.ca/events?format=json&frame=event_bn&source=http://kg.artsdata.ca/culture-creates/footlight/osm-ca

### Source parameter
Many different datasets are uploaded to Artsdata daily. The Event API allows you to specific the source of your dataset by passing a dataset URI or a catalog of datasets URI.

Here is a list of [individual datasets](https://s.zazuko.com/2owq14) that can be used as the source parameter. And here is a list of [catalogs of datasets]( https://s.zazuko.com/5hG5Cc) that can also be used as the source parameter.

It is possible to create your own catalog of datasets as well.

### Events demo

**NEW 12-NOV-2020** Here is a [demo website in Github](https://github.com/culturecreates/artsdata-demo-upcoming-events-api) that lists upcoming events in Quebec using the Artsdata API.


## Other APIs coming soon
The main goal of the Query API is to provide easy access to all data in Artsdata.ca. It offers SPARQL and traditional RESTful GETs (GraphQL in the works).
Responses can be in JSON or JSON-LD.  A user account enables persisted configurations for ranking graphs or settings for an iCalendar feed. 

Documentation coming.
