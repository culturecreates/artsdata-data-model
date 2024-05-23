---
title: Artsdata Databus API
layout: architecture-doc
---

An API that acts as a gateway between the outside world and the Artsdata Triplestore.


Artsdata Databus Service
-----------

The Artsdata Databus is primarily used to store metadata on RDF files hosted by 3rd parties so they can be automatically loaded into the Artsdata.ca triple store.

See documentation on the [Artsdata Databus API](https://documenter.getpostman.com/view/3157443/TVep7mv3)

The Artsdata Databus is a directory of versioned data dumps also know as datasets. Any dataset can be registered on the Databus in any format (RDF, CSV, JSON) as long as it is  available to download via a URL. The Databus only stores metadata about the dataset. The metadata includes the url to download the data, the format of the data (JSON, CSV, RDF), the name of the artifact, version and group, the user account registering the data, the dataset license, and depending on the data format it can also store the number of triples, number of classes, number of SHACL violations and other provenance data such as related agents used to create the dataset. The important concept is that registering a dataset on the Databus does not actually store the data in Artsdata. 

The Databus informs Artsdata graph-store when new versions of datasets are available. Artsdata decides which to import and can only load RDF data, so anything that is not in RDF cannot be loaded into the Artsdata Knowledge graph. Most of the datasets registered on the Databus are loaded within a few mintues. An example of a dataset that is not loaded into Artsdata are the datasets prepared for LaVitrine.

When Artsdata decides to load the data of a dataset registered on the Databus, the Artsdata graph-store service gets the download URL from the Databus and creates a graph using the artifact name. There are standard generic transformations that are done during the import to fix common problems and align the data to the Artsdata data model. Then it adds the SHACL report,  does some reconciliation, mints new Artsdata URIs and updates the core Artsdata entities based on ranking. A license for data sharing is assigned that may be different then the original dataset license.

Rules when using the Databus service:
* A free Artsdata account is needed to upload data to the Databus. If you wish to upload a dataset please contact the stewards of Artsdata.
* An Artdata account is linked to one or more Github accounts or [WebIDs](https://www.w3.org/wiki/WebID). Artsdata does not contain any credentials or passwords. 
* Every Dataset is organized by account/group/artifact/version and uses the [DataID](http://dataid.dbpedia.org/ns/core.html#) ontology
* When a dataset is added to the Databus, the Databus will inform the Artsdata graph-store service. Artsdata can then decide to load the lastest version of the artifact into it's own graph with URI http://kg.artsdata.ca/graph/ACCOUNT/GROUP/ARTIFACT
* URIs with domain kg.artsdata.ca are not allowed as a triple subject unless the URI already exists in Artsdata. This is to prevent mistakenly minting new URIs. If you wish to mint new Artsdata URIs please use the provided Artsdata service API that takes extra steps to prevent duplicates by requesting additional metadata.
* Ontologies are not allowed to be uploaded. If you wish to upload an ontology please contact the stewards of Artsdata.

Artsdata Databus SHACL validation reports
-----------

A SHACL validation service is available to test datasets prior to upload to the Artsdata Databus. This RESTful API service receives parameters for the SHACL file to apply and the data graph to test.  Contact [Culture Creates](mailto:info@culturecreates.com) for access to this service.

Credentials
--------

Uploading data to the Database API requires secure authentication. Artsdata can use either Github or WebID for authentication. Culture Creates is testing WebID as a novel way to identify and authenticate users. WebID has the advantage of enabling the user to be the main authority of their data. Authentication is done with the user's own secure key. In comparison to other services like Facebook Login, LinkedIn or OpenID, wuth WebID the user is the owner of their data and of the secure key and therefore their own authority. The WebID workflow uses public/private key cryptography and client certificate authorization to establish secure, authenticated HTTPS connections. See https://github.com/dbpedia/webid for more info.






