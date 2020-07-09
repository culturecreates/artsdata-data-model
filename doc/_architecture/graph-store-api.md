---
title: Graph-store API
layout: architecture-doc
---

The Graph-store API is an API server (built with RAILS) that acts as a gateway between the ouside world and the Artsdata Triplestore.

It offers SPARQL and traditional RESTful POSTs. 

The main goal of the Graph-store API is to defend the Artsdata.ca data model.  All data sent to Artsdata.ca must meet certain constraints. Data that does not meet these contrains are rejected and errors are reported back to the client.

This work in progress is using [SHACL](https://www.w3.org/TR/shacl/) to describe the contraints in an effort to be as data centric as possible (use data triples to describe rules instead of hard coding).

Miniting URIs as a service, will probably be added to this API pending further needs analysis. It provides an API for developers to request new URIs for entities being added to Artsdata. 

This service checks that the data meets all the requirements and constraints of the Artsdata data model. Each load is treated like a transaction.  Direct SPARQL insert is not allowed, however post load SPARQL transforms are allowed for the graph, and are done prior to checking the constrains needed to complete the transaction.  If there are critical errors then the transaction is cancelled and the graph is restored to the same state prior to the start of the load.

