---
title: Databus API
layout: architecture-doc
---

An API that acts as a gateway between the outside world and the Artsdata Triplestore.


Artsdata Databus Service
-----------

The Artsdata Databus is primarily used to store metadata on RDF files hosted by 3rd parties so they can be automatically loaded into the Artsdata.ca triple store.

See documentation on the [Artsdata Databus API](https://documenter.getpostman.com/view/3157443/TVep7mv3)

The Artsdata Databus is a directory of versioned artifacts sometimes called datasets. 

Any dataset's metadata can be registered on the Databus as long as the dataset remains available for download via a URL. The Databus only stores the metadata about the dataset, and not the datset itself. The metadata includes the url to download the data, the format of the data (JSON, CSV, RDF), the name of the artifact, version, group, the user account registering the data, the dataset license, and depending on the data format it can also store the number of triples, number of classes, number of SHACL violations and other provenance data such as related agents used to create the dataset. Note that registering a dataset on the Databus does not actually store the data in Artsdata. 

The Databus informs Artsdata graph-store when new versions of datasets are available. Artsdata decides which to import and can only load RDF data, so anything regsitered on the Databus that is not in a serialized RDF format cannot be loaded directly into the Artsdata Knowledge graph. Third parties are welcome to query the Artsdata Databus for non-RDF artifacts and register a derived RDF dataset.

Most of the datasets registered on the Databus are loaded into an Artsdata graph within a few mintues.

When an Artsdata steward decides to subscribe to an artifact registered on the Databus, the Artsdata graph-store service gets the download URL from the Databus artifact-version and creates/replaces a graph with the artifact URI. There are standard generic transformations that are done during the import to fix common problems. If the Artifact is registerd with a SHACL file, then a SHACL report is added to the Artsdata graph. The graph can then be used for reconciliation. Reconciliation consists of adding sameAs links, minting new Artsdata URIs, and updating the core Artsdata entities based on ranking. 

Rules when using the Databus service:
* You must be a member of an Artsdata Databus team. If you wish to upload a dataset please contact the stewards of Artsdata. 
* Every Dataset is organized by account/group/artifact/version and uses the [DataID](http://dataid.dbpedia.org/ns/core.html#) ontology
* When a dataset (artifact-version) is added to the Artsdata Databus, if Artsdata is subscribed to the artifact it will load the lastest version of the artifact into a graph with URI http://kg.artsdata.ca/ACCOUNT/GROUP/ARTIFACT
* URIs with domain kg.artsdata.ca are not allowed as a triple subject unless the URI already exists in Artsdata. This is to prevent mistakenly minting new URIs. If you wish to mint new Artsdata URIs please use the provided Artsdata service API that takes extra steps to prevent duplicates by requesting additional metadata.
* Ontologies are not allowed to be uploaded. If you wish to upload an ontology please contact the stewards of Artsdata.

The relationships among the group, artifact, version, and file are depicted in the following diagram, courtesy of Dbpedia. For more details visit https://dbpedia.gitbook.io/databus/model/how-to

![image](https://github.com/user-attachments/assets/ce89d67a-ee48-4c54-92c9-43b0dcaadda1)


Artsdata Databus SHACL validation reports
-----------

A SHACL validation service is available to test datasets prior to upload to the Artsdata Databus. This RESTful API service receives parameters for the SHACL file to apply and the data graph to test.  Contact [Culture Creates](mailto:info@culturecreates.com) for access to this service.

Credentials
--------

Uploading data to the Database API requires secure authentication. Artsdata can use either Github or WebID for authentication. Culture Creates is testing WebID as a novel way to identify and authenticate users. WebID has the advantage of enabling the user to be the main authority of their data. Authentication is done with the user's own secure key. In comparison to other services like Facebook Login, LinkedIn or OpenID, when using WebID the user remains the owner of their data and of the secure key and therefore represent their own authority. The WebID workflow uses public/private key cryptography and client certificate authorization to establish secure, authenticated HTTPS connections. See https://github.com/dbpedia/webid for more info.






