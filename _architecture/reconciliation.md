---
title: Reconciliation API
layout: architecture-doc
---

The Artsdata.ca Reconciliation Service can be used to add Artsdata IDs to your structured data. 

Supported entity types include: 
* Event
* Person
* Organization
* Place
* Artsdata Event Type

In the future we are planning to add Performing Arts Productions and Works. Give it a try using the [Test bench](https://reconciliation-api.github.io/testbench/#/client/https%3A%2F%2Fapi.artsdata.ca%2Frecon)! 

This API follows the documentation provided by the [W3C Entity Reconciliation Community Group](https://reconciliation-api.github.io/specs/latest/). 

## Manual reconciliation
To manually add Artsdata IDs to your structured data:
1. Open the [Test bench](https://reconciliation-api.github.io/testbench/#/client/https%3A%2F%2Fapi.artsdata.ca%2Frecon)
2. Select a radio button for the type of entity you want to reconcile. For example 'Place'.
3. Enter the name of the entity. For example 'Salle André-Mathieu'.
4. Click the 'Reconcile' button to search Artsdata. 
5. Select the URI for the matching entity ID. The search results are shown on the right side of the screen sorted by score. Be sure the copy the entire URI. For example: http://kg.artsdata.ca/resource/K11-211
6. Add the URI to your structured data using 'sameAs'.


## Adding additional properties
In addition to the type of entity, you can add additional properties to improve the accuracy of the reconiliation.

For example to add a postal code when reconiling places, add the property id "schema:address/schema:postalCode" and the postal code.
<img width="564" alt="Screenshot 2024-01-31 at 4 02 49 PM" src="https://github.com/culturecreates/artsdata-data-model/assets/419491/1944952b-de90-4a86-a097-a06a8185a5bf">
<img width="607" alt="Screenshot 2024-01-31 at 4 02 38 PM" src="https://github.com/culturecreates/artsdata-data-model/assets/419491/33b1974c-bf06-4d86-b659-2490e769aebf">

## Example of structred data with added 'sameAs'
Example for an event's location linked to an Artdata URI. The `"sameAs": "http://kg.artsdata.ca/resource/K11-211"` has been added.
```
{
  "@context": "https://schema.org",
  "@type": "Event",
  "name": {
    "@language": "fr",
    "@value": "Diane Dufresne | Sur rendez-vous"
  },
  "startDate": "2025-07-21T19:00-05:00",
  "location": {
    "@type": "Place",
    "name": {
      "@language": "fr",
      "@value": "Salle André-Mathieu"
    },
    "address": {
      "@type": "PostalAddress",
      "addressLocality": "Laval",
      "addressCountry": "CA",
      "streetAddress": "475 Bd de l'Avenir",
      "postalCode": "H7N 5H9",
      "addressRegion": "Québec"
    },
    "sameAs": "http://kg.artsdata.ca/resource/K11-211"
}
```
## Batch reconciliation

To batch reconcile, use tools like [OpenRefine](https://openrefine.org) and point the reconilication tool to the Artsdata reconciliation endpoint. View this [screen recording](https://youtu.be/VkOncek9iuY).

Reconciliation service endpoint: https://api.artsdata.ca/recon

## Upcoming tools

Here is a sneek video preview of a prototype plug-in to Airtable https://youtu.be/ngX-EHipKDU
