---
title: Query API
layout: architecture-doc
---

The Query API offers a collection of APIs that acts as a gateway between the outside world and the Artsdata Triplestore.

## Reconciliation Service

**NEW 22-OCT-2020**: The Artsdata.ca Reconciliation Service can be used to link entites to Artsdata.ca IDs. Supported entites include People, Organizations, and Places. In the future Performing Arts Productions and Works will be added. This API follows the documentation provided by the [W3C Entity Reconciliation Community Group](https://reconciliation-api.github.io/specs/latest/). This API can be consumed by tools like [OpenRefine](https://openrefine.org) to add Artsdata.ca IDs (for example artists) to enrich an existing spreadsheet.

Reconciliation service endpoint: https://api.artsdata.ca/recon

Give it a try using the [Test bench](https://reconciliation-api.github.io/testbench/)! (click 'Test bench' tab and enter the endpoint). Or view this [screen recording](https://youtu.be/VkOncek9iuY).

## Preview Service

Artsdata Preview Service provides embeddable HTML previews of entities (for example artists) directly in a user interface. This API is consumed along with the Reconciliation Service, by tools like [OpenRefine](https://openrefine.org) where you can roll-over Artsdata.ca IDs (for example artists) and get a preview of information (photo, occupation, nationality, ISNI) to help with disambiguation. Documentation provided by the [W3C Entity Reconciliation Community Group](https://reconciliation-api.github.io/specs/latest/).


## Events BETA

The Artsdata Events API provides an easy way to get a iist of events in json or json-ld. Documentation WIP.

Example: List of upcoming events from the OSM website in Montreal: http://api.artsdata.ca/events?format=json&source=http://kg.artsdata.ca/culture-creates/footlight/osm-ca

### Source parameter
Many different datasets are uploaded to Artsdata daily. The Event API allows you to specific the source of your dataset by passing a dataset URI or a catalog of datasets URI.

Here is a list of imdividual datasets that can be used as the source parameter: https://s.zazuko.com/2owq14

It is possible to create your own catalog of datasets as well.

### Events demo

Here is a [demo website in Github](https://github.com/culturecreates/artsdata-demo-upcoming-events-api) that lists upcoming events in Quebec using the Artsdata API.


## Other APIs coming soon
The main goal of the Query API is to provide easy access to all data in Artsdata.ca. It offers SPARQL and traditional RESTful GETs (GraphQL in the works).
Responses can be in JSON or JSON-LD.  A user account enables persisted configurations for ranking graphs or settings for an iCalendar feed. 

Documentation coming.
