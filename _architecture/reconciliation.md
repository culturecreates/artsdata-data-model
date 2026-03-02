---
title: Reconciliation API
layout: architecture-doc
---

The Artsdata.ca Reconciliation Service can be used to add Artsdata IDs to your structured data. 

Supported entity types include: 
* Event
* Place
* Person
* Organization
* Agent (Person or Organization/Group)
* Concept (Event type, Genre, etc.)

Give it a try using the [Test bench](https://reconciliation-api.github.io/testbench/#/client/https%3A%2F%2Fapi.artsdata.ca%2Frecon)! 

This API follows the documentation provided by the [W3C Entity Reconciliation Community Group](https://reconciliation-api.github.io/specs/latest/). In addition to the basic reconciliation, it provides all optional services in the documentation:
* Reconciliation: It can return matching matching entities based on their name string, type and properties (read more below)
* Preview: It can provide embeddable HTML previews of entities, which clients can display in their user interface.
* Suggest: It can provide auto-complete endpoints for entities, properties and types.
* Data extension: It can let clients fetch the values of some properties (i.e. a bit like a GET call but just for selected properties). 

The reconciliation service endpoint is `https://api.artsdata.ca/recon`.

## Manual reconciliation using the Test Bench
To manually add Artsdata IDs to your structured data:
1. Open the [Test bench](https://reconciliation-api.github.io/testbench/#/client/https%3A%2F%2Fapi.artsdata.ca%2Frecon)
2. Select a radio button for the type of entity you want to reconcile. For example 'Place'.
3. Enter the name of the entity. For example 'Salle André-Mathieu'. Or enter the official website url.
4. Click the 'Reconcile' button to search Artsdata. 
5. Select the URI for the matching entity ID. The search results are shown on the right side of the screen sorted by score. Be sure the copy the entire URI. For example: http://kg.artsdata.ca/resource/K11-211
6. Add the URI to your structured data using 'sameAs'.
    * [How to add the Artsdata ID with the 'sameAs' property](https://docs.artsdata.ca/sameas.html)

### Adding additional properties
In addition to the type of entity, you can add additional properties to improve the accuracy of the reconiliation. The additional properties are required to be in the returned entities. Any entity that does not match the additional property will be exluded from the reconciliation results.

For example to add a postal code when reconiling places, add the property id "schema:address/schema:postalCode" and the postal code.
<img width="564" alt="Screenshot 2024-01-31 at 4 02 49 PM" src="https://github.com/culturecreates/artsdata-data-model/assets/419491/1944952b-de90-4a86-a097-a06a8185a5bf">
<img width="607" alt="Screenshot 2024-01-31 at 4 02 38 PM" src="https://github.com/culturecreates/artsdata-data-model/assets/419491/33b1974c-bf06-4d86-b659-2490e769aebf">

## Artsdata batch reconciliation tool

Logged in users may use to Artsdata Batch Reconciliation Tool to quickly reconcile entire datasets.

The tool can be accessed via the kg.artsdata.ca interface menu. Documentation will be published soon.

## Batch reconciliation using Open Refine

To batch reconcile, you may also use tools like [OpenRefine](https://openrefine.org) and point the reconilication tool to the Artsdata reconciliation endpoint. View this [screen recording](https://youtu.be/VkOncek9iuY).

Reconciliation service endpoint: [https://api.artsdata.ca/recon](https://api.artsdata.ca/recon)

## Manual reconciliation within the Artsdata interface

The reconciliation service is also used by several features in the Artsdata interface. For example, a logged-in user may reconcile entities from a previously uploaded data source using the following methods:

* Manually mint/link a top-level or nested entity with the "Minter" feature, if the entity is assigned a persistent URI by the source (i.e. a [local URI]({{ base }}/identifier-recommendations)) or as part of the Extract-Transform-Load process;
* Manually add a sameAs to a nested entity as part of the "Mint from blank node" suite of features, if the entity is a nested blanked node in the uploaded graph.

These features are useful when entities come back recurrently within a data source.
