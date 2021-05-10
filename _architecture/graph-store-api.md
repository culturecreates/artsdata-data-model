---
title: Graph-store API
layout: architecture-doc
---

An API server (built with RAILS) that acts as a gateway between the outside world and the Artsdata Triplestore.

It offers SPARQL and traditional RESTful POSTs. 


Artsdata Databus Service
-----------

The Artsdata Databus is primarily used to store metadata on RDF files hosted by 3rd parties so they can be automatically loaded into the Artsdata.ca triple store.

See documentation on the [Artsdata Databus API](https://documenter.getpostman.com/view/3157443/TVep7mv3)


Graph-store Services
--------
The main goal of the Graph-store API is to defend the Artsdata.ca data model.  All data sent to Artsdata.ca must meet certain constraints. Data that does not meet these constrains are rejected and errors are reported back to the client.

This work in progress is using [SHACL](https://www.w3.org/TR/shacl/) to describe the contraints in an effort to be as data-centric as possible (use data triples to describe rules instead of hard coding).

This service checks that the data meets all the requirements and constraints of the Artsdata data model. Each load is treated like a transaction.  Direct SPARQL insert is not allowed, however post load SPARQL transforms are allowed for the graph, and are done prior to checking the constrains needed to complete the transaction.  If there are critical errors then the transaction is cancelled and the graph is restored to the same state prior to the start of the load.

Uploading data to the Graph-store API requires secure authentication. Culture Creates is testing WebID as a novel way to identify and authenticate users. WebID has the  advantage of enabling the user to be the main authority of their data. Authentication is done with the user's own secure key. In comparison to other services like Facebook Login, LinkedIn or OpenID, the user is the owner of their data and of the secure key and therefore their own authority. The WebID workflow uses public/private key cryptography and client certificate authorization to establish secure, authenticated HTTPS connections. See https://github.com/dbpedia/webid for more info.


Other Services
--------

Minting URIs as a service, will probably be added to this API pending further needs analysis. It provides an API for developers to request new URIs for entities being added to Artsdata. 




