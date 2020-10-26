---
title: Query API
layout: architecture-doc
---

The Query API offers a collection of APIs (built with RAILS) that acts as a gateway between the outside world and the Artsdata Triplestore.

## Reconciliation Service API

**NEW 22-OCT-2020**: The Artsdata.ca Reconciliation Service API can be used to link entites to Artsdata.ca IDs. Supported entites include People, Organizations, and Places. In the future Performing Arts Productions and Works will be added. This API follows the documentation provided by the [W3C Entity Reconciliation Community Group](https://reconciliation-api.github.io/specs/latest/). This API can be consumed by tools like [OpenRefine](https://openrefine.org) to add Artsdata.ca IDs (for example artists) to enrich an existing spreadsheet.

Reconciliation service endpoint: https://api.artsdata.ca/recon.

Give it a try using the [Test bench](https://reconciliation-api.github.io/testbench/)! (click 'Test bench' tab and enter the endpoint)

## Preview API

Check it out!

## Other APIs coming soon
The main goal of the Query API is to provide easy access to all data in Artsdata.ca. It offers SPARQL and traditional RESTful GETs (GraphQL in the works).
Responses can be in JSON or JSON-LD.  A user account enables persisted configurations for ranking graphs or settings for an iCalendar feed. 

Documentation coming.
