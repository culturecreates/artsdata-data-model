---
title: Reconciliation API
layout: architecture-doc
---

The Artsdata.ca Reconciliation Service can be used to link entites to Artsdata.ca IDs. 

Supported entity types include: Event, Person, Organization, Place and Artsdata Event Type. In the future Performing Arts Productions and Works will be added. 

## Manual reconciliation
To manually add Artsdata IDs to your structred data:
1. Open the [Test bench](https://reconciliation-api.github.io/testbench/#/client/https%3A%2F%2Fapi.artsdata.ca%2Frecon)
2. Select a radio button for the type of entity you want to reconcile. For example 'Place'.
3. Enter the name of the entity. For example 'Salle André-Mathieu'.
4. Click the 'Reconcile' button to search Artsdata. 
5. Select the URI for the matching entity ID. The search results are shown on the right side of the screen sorted by score. Be sure the copy the entire URI. For example: http://kg.artsdata.ca/resource/K11-211
6. Add the URI to your structured data using 'sameAs'.

Example for an event's location linked to an Artdata URI.
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

This API follows the documentation provided by the [W3C Entity Reconciliation Community Group](https://reconciliation-api.github.io/specs/latest/). 

Give it a try using the [Test bench](https://reconciliation-api.github.io/testbench/#/client/https%3A%2F%2Fapi.artsdata.ca%2Frecon)! 
