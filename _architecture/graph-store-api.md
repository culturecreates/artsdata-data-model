---
title: Artsdata Databus API
layout: architecture-doc
---

An API that acts as a gateway between the outside world and the Artsdata Triplestore.


Artsdata Databus Service
-----------

The Artsdata Databus is primarily used to store metadata on RDF files hosted by 3rd parties so they can be automatically loaded into the Artsdata.ca triple store.

See documentation on the [Artsdata Databus API](https://documenter.getpostman.com/view/3157443/TVep7mv3)

The Databus breaks existing pipelines into individual components that together form a decentralized, but centrally coordinated data network.

Rules when using the Databus service:
* An Artsdata account is needed to upload data to the Databus. If you wish to upload a dataset please contact the stewards of Artsdata.
* An Artdata account is linked to one or more [WebIDs](https://www.w3.org/wiki/WebID). Password management is thus the responsibility of the WebID host. Artsdata does not contain any credentials or passwords.
* Every Dataset is organized by account/group/artifact/version and uses the [DataID](http://dataid.dbpedia.org/ns/core.html#) ontology
* When a dataset is added to the Databus, the Databus will attempt to use the graph-store services to load the lastest version of the artifact into it's own graph with URI http://kg.artsdata.ca/graph/ACCOUNT/GROUP/ARTIFACT
* URIs with domain kg.artsdata.ca are not allowed as a triple subject unless the URI already exists in Artsdata. This is to prevent mistakenly minting  new URIs. If you wish to mint new Artsdata URIs please use the provided Artsdata service API that takes extra steps to prevent duplicates by requesting additional metadata.
* Ontologies are not allowed to be uploaded. If you wish to upload an ontology please contact the stewards of Artsdata.

Artsdata Databus SHACL validation reports
-----------

A SHACL validation service is available to test datasets prior to upload to the Artsdata Databus. This RESTful API service receives parameters for the SHACL file to apply and the data graph to test.  Contact [Culture Creates](mailto:info@culturecreates.com) for access to this service.

Credentials
--------

Uploading data to the Database API requires secure authentication. Culture Creates is testing WebID as a novel way to identify and authenticate users. WebID has the  advantage of enabling the user to be the main authority of their data. Authentication is done with the user's own secure key. In comparison to other services like Facebook Login, LinkedIn or OpenID, wuth WebID the user is the owner of their data and of the secure key and therefore their own authority. The WebID workflow uses public/private key cryptography and client certificate authorization to establish secure, authenticated HTTPS connections. See https://github.com/dbpedia/webid for more info.






