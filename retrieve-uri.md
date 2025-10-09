# How to Retrieve Persistent Identifiers' URIs

When working with linked open data, it’s important to refer to cultural entities (like organizations, people, venues, and events) using stable identifiers.

Artsdata provides Uniform Resource Identifiers (URIs) for cultural entities in Canada. These URIs are designed to be persistent and interoperable across the web.

This page will show you how to find and use an Artsdata URI.

## Retrieving Artsdata URIs

### Option 1: Manual Retrieval

Anyone can use Artsdata’s search tool on the knowledge graph’s interface to find a entity and retrieve its Artsdata URI. Once you’ve become familiar with the process, it takes less than 10 seconds to retrieve an Artsdata URI.

#### Tutorial Video

Watch “[How to Retrieve an Artsdata URI](https://youtu.be/HRv1GCegFws)” ([Version française](https://youtu.be/sICvNpBHroE)) 
Video duration: 3.5 minutes. English and French subtitles available.

In the video, we walk through an example: a cultural worker at Tangente (a Montreal-based dance presenter) is preparing event metadata and wants to clearly identify her organization as the official presenter of a dance series at the Édifice Wilder. She searches for Tangente’s URI in the Artsdata Knowledge Graph and copies the correct URI into her documentation.

#### Quick Steps

1. Go to [kg.artsdata.ca](https://kg.artsdata.ca/)
2. Search using:
    - The name of the organization, venue, or person
    - Their website URL
    - An existing Artsdata ID (e.g. K10-337)
3. Identify the correct entry by confirming:
    - Type (Organization, Person, Place, Event)
    - Description (e.g. city or occupation)
4. Click the blue ID, e.g. ad:K10-337
5. On the record page, look for the URI below the title:
   - Example: https://kg.artsdata.ca/resource/K10-337
6. Copy and paste this URI into your structured data, documentation, and metadata.

### Option 2: Automated Retrieval via the Artsdata Reconciliation Service

Developers can also call the Artsdata Reconciliation API to retrieve the Artsdata URIs. Depending on the application’s setting, this can work in a similar fashion as Google Search’s auto-suggestion feature: the user types in a performer name and the reconciliation service returns entities with similar names along with their Artsdata URI. When the user selects an entity, the full name and the Artsdata URI are automatically loaded in the application. Additional data points, including other persistent identifiers, can also be passed along with the Artsdata URI.

## Retrieving URIs from other Knowledge Bases

To be completed...

## How Do You Know You’ve Found the Right URI?

When you follow these steps, you’re not just grabbing any link — you’re identifying a verified, unique identifier that points to one specific cultural entity in the Artsdata Knowledge Graph.

To confirm that it’s the right one:
* Search accuracy: You’ve used specific input — name, website URL, or existing ID — to narrow results.
* The correct entity: The record matches key traits:
* Type: Does the entity have the right type? Sometimes, an organization (Organization type) and a venue (Place type) may have the same name. Similarly, many live performance events have (Event type) the same name as the main performer (Person or Organization type). 
* Description: Does the location, occupation, or label match what you’re looking for?

## What if I can’t find my organization?

If your entity is not in Artsdata, or if your record needs to be updated, visit artsdata.ca or contact us at artsdata@capacoa.ca. 

The Artsdata team can help you add or correct information.
