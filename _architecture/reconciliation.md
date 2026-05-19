---
title: Reconciliation API
layout: architecture-doc
nav_order: 14
---

The Artsdata.ca Reconciliation Service can be used to add Artsdata IDs to your structured data. 

Supported entity types include: 
* Event
* Place
* Person
* Organization
* Artsdata Live Performance Work
* Agent (Person or Organization/Group)
* Artsdata Event Type
* Concept (Event type, Genre, etc.)

Give it a try using the [Reconciliation Service Test Bench 1.0](https://reconciliation-api.github.io/testbench/1.0/#/client/https%3A%2F%2Frecon.artsdata.ca)

The Artsdata Reconciliation API implements the specifications provided by the [W3C Entity Reconciliation Community Group](https://reconciliation-api.github.io/specs/latest/). It complies with [v1.0-draft](https://reconciliation-api.github.io/specs/1.0-draft/) and continues to fully support [v0.2](https://www.w3.org/community/reports/reconciliation/CG-FINAL-specs-0.2-20230410/).

In addition to the basic entity matching, the Artsdata Reconciliation Service v1.0 provides all optional services described in the [documentation](https://reconciliation-api.github.io/specs/1.0-draft/):
* Match: It can return matching entities based on their name string, type and properties (read more below)
* Preview: It can provide embeddable HTML previews of entities, which clients can display in their user interface.
* Suggest: It can provide auto-complete endpoints for entities, properties and types.
* Data extension: It can let clients fetch the values of some properties (i.e. a bit like a GET call but just for selected properties). 

The Artsdata reconciliation endpoints:
- Current version 0.2: `https://api.artsdata.ca/recon`
- New version 1.0-draft: `https://recon.artsdata.ca/` [Swagger API doc](https://recon.artsdata.ca/api)

## Manual reconciliation using the Test Bench
To manually add Artsdata IDs to your structured data:
1. Open the Test Bench:
    * [Version 1.0-draft](https://reconciliation-api.github.io/testbench/1.0/#/client/https%3A%2F%2Frecon.artsdata.ca)
    * [Version 0.2](https://reconciliation-api.github.io/testbench/0.2/#/client/https%3A%2F%2Fapi.artsdata.ca%2Frecon) 
2. Select a radio button for the type of entity you want to reconcile. For example 'Place'.
3. Enter the name of the entity. For example 'Salle André-Mathieu'. 
4. Click the 'Reconcile' button to search Artsdata. 
5. Select the URI for the matching entity ID. The search results are shown on the right side of the screen sorted by score. Be sure the copy the entire URI. For example: http://kg.artsdata.ca/resource/K11-211
6. Add the URI to your structured data using 'schema:sameAs'.
    * [How to add the Artsdata ID with the 'sameAs' property](https://docs.artsdata.ca/sameas.html)

### Using additional properties
In addition to the name and type of entity, you can add additional properties to improve the accuracy of the reconiliation. Select "Required" to force the additional properties to be present in the returned entities.

For example to add a postal code when reconiling places, add the property id "schema:address/schema:postalCode" and the postal code.
<img width="564" alt="Screenshot 2024-01-31 at 4 02 49 PM" src="https://github.com/culturecreates/artsdata-data-model/assets/419491/1944952b-de90-4a86-a097-a06a8185a5bf">
<img width="607" alt="Screenshot 2024-01-31 at 4 02 38 PM" src="https://github.com/culturecreates/artsdata-data-model/assets/419491/33b1974c-bf06-4d86-b659-2490e769aebf">

## Artsdata Batch Reconcile Tool

Users that are logged-in to Artsdata may use the **Artsdata Batch Reconcile** user interface to quickly reconcile large datasets. The datasets must first be loaded into Artsdata in a prior step.

The tool can be accessed via the [kg.artsdata.ca](https://kg.artsdata.ca) main menu (top right). More documentation will be published soon.

## Batch Reconciliation using Open Refine

Third party tools like [OpenRefine](https://openrefine.org) can be used to batch reconcile with Artsdata. Point the reconciliation tool to the Artsdata reconciliation endpoint. View this [screen recording](https://youtu.be/VkOncek9iuY).

OpenRefine (last checked May 2026) only works with API v0.2: `https://api.artsdata.ca/recon`

## Manual Reconciliation using the Artsdata User Interface

The reconciliation service is also used by several features in the Artsdata user interface. For example, a logged-in user may reconcile entities from a previously uploaded data source using the following methods:

* Manually mint/link a top-level entity with the "Minter" feature, if the entity is assigned a URI.
* Manually add a sameAs to a nested entity as part of the "Mint from blank node" feature, if the entity is a nested blanked node in the uploaded graph. This feature is useful when the same entity comes back frequently within a data source, such as the events location.
