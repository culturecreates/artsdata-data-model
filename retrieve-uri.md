# How to Retrieve Persistent Identifiers' URIs

When working with linked open data, it’s important to refer to cultural entities (like organizations, people, venues, and events) using stable identifiers.

Artsdata provides Uniform Resource Identifiers (URIs) for cultural entities in Canada. These URIs are designed to be persistent and interoperable across the web.

This page will show you how to find and use an Artsdata URI.

## What is an Artsdata URI?

A URI (Uniform Resource Identifier) is a stable web address that uniquely identifies a resource — even if the content or website changes. Unlike a simple URL, a URI is designed to be machine-readable, interoperable, and useful in structured data and linked open data applications.

Each entity in Artsdata — such as an organization, venue, person, or event — has a unique URI.

Example:

**Short ID: K10-337
Full URI: https://kg.artsdata.ca/resource/K10-337**

Think of the ID as a shorthand, and the full URI as the authoritative reference link.

## Watch the Tutorial Video

Watch “[How to Retrieve an Artsdata URI](https://youtu.be/HRv1GCegFws)” ([Version française](https://youtu.be/sICvNpBHroE)) 
Video duration: 3.5 minutes. English and French subtitles available.

In the video, we walk through an example: a cultural worker at Tangente (a Montreal-based dance presenter) is preparing event metadata and wants to clearly identify her organization as the official presenter of a dance series at the Édifice Wilder. She searches for Tangente’s URI in the Artsdata Knowledge Graph and copies the correct URI into her documentation.

## How to Retrieve an Artsdata URI (Quick Steps)

1) Go to kg.artsdata.ca

2) Search using:
* The name of the organization, venue, or person
* Their website URL
* An existing Artsdata ID (e.g. K10-337)

3) Identify the correct entry by confirming:
* Type (Organization, Person, Place, Event)
* Description (e.g. city or occupation)

4) Click the blue ID, e.g. ad:K10-337

5) On the record page, look for the URI below the title:
* Example: https://kg.artsdata.ca/resource/K10-337

6) Copy and paste this URI into your structured data, documentation, and metadata.

## How Do You Know You’ve Found the Right URI?

When you follow these steps, you’re not just grabbing any link — you’re identifying a verified, unique identifier that points to one specific cultural entity in the Artsdata Knowledge Graph.

To confirm that it’s the right one:
* Search accuracy: You’ve used specific input — name, website URL, or existing ID — to narrow results.
* The correct entity: The record matches key traits:
* Type: Does the entity have the right type? Sometimes, an organization (Organization type) and a venue (Place type) may have the same name. Similarly, many live performance events have (Event type) the same name as the main performer (Person or Organization type). 
* Description: Does the location, occupation, or label match what you’re looking for?

## When and Why to Use URIs

Use Artsdata URIs when:
* Publishing metadata on your website (e.g. schema.org)
* Submitting event listings to platforms like the Canadian Arts Presentation Exchange (CAPE)
* Documenting roles in Wikidata or other structured data projects
* Connecting datasets across systems

Using URIs contributes to making your data FAIR:
* Findable: URIs are globally unique and indexed, making it easier for both humans and machines to locate your data.
* Accessible: Artsdata URIs resolve to open, publicly available records through standard web protocols.
* Interoperable: URIs can be used across different systems and datasets, thanks to linked open data standards like RDF and schema.org.
* Reusable: Each URI provides clear provenance and is structured in a machine-readable way, enabling long-term use and integration.

## What if I can’t find my organization?

If your entity is not in Artsdata, or if your record needs to be updated, visit artsdata.ca or contact us at artsdata@capacoa.ca. 

The Artsdata team can help you add or correct information.
