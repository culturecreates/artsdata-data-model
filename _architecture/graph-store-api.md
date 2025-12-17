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

Dataset metadata can be registered on the Databus as long as the dataset remains available for download via a download URL. 

The Databus only stores metadata about the dataset, and not the datset itself. The metadata includes the url to download the data, the format of the data (JSON, CSV, RDF), the name of the artifact, version, group, the user account registering the data, the dataset license, and depending on the data format it can also store the number of triples, number of classes, number of SHACL violations and other provenance data such as related agents used to create the dataset. Note that registering a dataset on the Databus does not actually store the data in Artsdata. 

The Databus informs Artsdata when new versions of datasets are available. ONLY RDF formats can be loaded into the Artsdata Knowledge graph. Most datasets registered on the Databus are loaded into Artsdata within a few mintues. There are standard generic transformations that are done during the import to fix common problems. If the Artifact is registerd with a SHACL file, then a SHACL report is added to the Artsdata graph. The imported graph can be used for reconciliation. Reconciliation consists of adding sameAs links, minting new Artsdata URIs, and updating the core Artsdata entities based on graph ranking. 

Rules when using the Databus service:
* You must be a member of an Artsdata Databus team. If you wish to upload a dataset please contact the stewards of Artsdata. 
* Every Dataset is organized by account/group/artifact/version and uses the [DataID](https://github.com/dbpedia/DataId-Ontology) ontology
* When a dataset (artifact-version) is loaded into Artsdata, it replaces any existing artifact.
* URIs with domain kg.artsdata.ca are not allowed as a triple subject. 
* Ontologies are not allowed to be uploaded. If you wish to upload an ontology please contact the stewards of Artsdata.

The relationships among the group, artifact, version, and file are depicted in the following diagram, courtesy of Dbpedia. For more details visit https://dbpedia.gitbook.io/databus/model/how-to

![image](https://github.com/user-attachments/assets/ce89d67a-ee48-4c54-92c9-43b0dcaadda1)


Artsdata Databus SHACL validation reports
-----------

A SHACL validation service is available to test datasets prior to upload to the Artsdata Databus. This RESTful API service receives parameters for the SHACL file to apply and the data graph to test.  Contact [Culture Creates](mailto:info@culturecreates.com) for access to this service.

Credentials
--------
Uploading data to the Databus API requires secure authentication. Artsdata can use either Github or [WebID](https://github.com/dbpedia/webid) for authentication. Alternatively, an X-API-KEY may be supplied in the header. Contact stewards of Artsdata to determine the necessary credentials for your organization. 






