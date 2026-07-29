---
title: SPARQL Endpoint
layout: architecture-doc
nav_order: 15
---

A SPARQL endpoint is a web service that allows users to query a dataset using the SPARQL query language, which is designed for querying RDF (Resource Description Framework) data.

The SPARQL service for humans: [https://query.artsdata.ca/sparql](https://query.artsdata.ca/sparql). 

For coders there are 2 SPARQL endpoints:
1. [https://query.artsdata.ca/query](https://query.artsdata.ca/query) is recommended, but does not support federation.

2. [http://db.artsdata.ca/repositories/artsdata](http://db.artsdata.ca/repositories/artsdata) is a fully compliant SPARQL 1.1 endpoint by GraphDB, but may be closed to the public in the future.

## Wikidata Interlinking

Artsdata.ca has created property [P7627](https://www.wikidata.org/wiki/Property:P7627) in Wikidata for linking entities from Wikidata to Artsdata.ca

Using the [Wikidata Query Service](https://query.wikidata.org) it is possible to do a federated SPARQL to Artsdata. Wikidata blocks incoming federated SPARQLs but does have a whitelist of allowed SPARQL endpoints for federated queries originating on Wikidata. The current white labeled Artsdata SPARQL endpoint allowed on Wikidata is `SERVICE <https://artsdata-trifid-production.herokuapp.com/query>`. This will soon be changed to a more permanent Artsdata endpoint.

For help maintaining bi-directional interlinking between Artsdata and Wikidata please refer to this [README](https://github.com/culturecreates/artsdata-planet-wikidata) in the [artsdata-planet-wikidata](https://github.com/culturecreates/artsdata-planet-wikidata) repo.
