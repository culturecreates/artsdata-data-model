{% include back-button.html %}

{% include retrieve-uri-languages.html %}

# How to Retrieve Artsdata URIs (Persistent Identifiers)

When working with linked open data, it’s important to refer to cultural entities (like organizations, people, venues, and events) using stable identifiers.

Artsdata provides Uniform Resource Identifiers (URIs) for cultural entities in Canada. These URIs are designed to be persistent and interoperable across the web.

This page will show you how to find and use an Artsdata URI.

## Retrieving Artsdata URIs

### Option 1: Manual Retrieval

Anyone can use Artsdata’s search tool on the knowledge graph’s interface to find a entity and retrieve its Artsdata URI. Once you’ve become familiar with the process, it takes less than 10 seconds to retrieve an Artsdata URI.

#### Tutorial Video

Watch “[How to Retrieve an Artsdata URI](https://youtu.be/HRv1GCegFws)” ([Version française](https://youtu.be/sICvNpBHroE)) 
Video duration: 3.5 minutes. English and French subtitles available.

This video walks through a real example: a cultural worker at Tangente (a Montreal-based dance presenter) retrieves her organization’s URI from Artsdata to correctly document a dance series at the Édifice Wilder.

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

Developers can also use the Artsdata Reconciliation API to retrieve Artsdata URIs.

Depending on the application’s setting, this can work in a similar fashion as Google Search’s auto-suggestion feature: 

* The user types in a performer name;
* The reconciliation service returns entities with similar names along with their Artsdata URI;
* The user selects an entity, and the full name and the Artsdata URI are automatically loaded;
* Additional data points can be passed along with the Artsdata URI.

## Retrieving URIs from other Knowledge Bases

Other open knowledge bases also provide persistent identifiers for cultural entities. These can often be used alongside Artsdata URIs to enhance your metadata.

Examples include:
- **Wikidata**: https://www.wikidata.org
- **ISNI (International Standard Name Identifier)**: https://isni.org
- **MusicBrainz** (for performers and recordings): https://musicbrainz.org

To retrieve an identifier:
1. Search for the entity by name or other known details.
2. Confirm that the record matches (type, location, description).
3. Copy the URI or permanent ID shown on the page.
4. Optionally, include it in your metadata using schema.org or JSON-LD.

## How Do You Know You’ve Found the Right URI?

When you follow these steps, you’re not just grabbing any link. You’re identifying a verified, unique identifier that points to one specific cultural entity in the Artsdata Knowledge Graph.

To confirm it’s correct, verify:
* Search accuracy: You used precise input (name, URL, or ID).
* Entity match: The record’s type and description align with what you’re looking for.
    * Type: Does the entity have the right type? Sometimes, an organization (Organization type) and a venue (Place type) may have the same name. Similarly, many live performance events have (Event type) the same name as the main performer (Person or Organization type).
    * Description: Does the location, occupation, or label match what you’re looking for? 
* Location: The URI appears just below the record title — it is the canonical identifier, not just a webpage link.
* Trusted source: The URI comes from Artsdata’s authoritative database (kg.artsdata.ca).

## What if I can’t find my organization?

If your entity is not in Artsdata, or if your record needs to be updated:
* Visit artsdata.ca
* Email us at artsdata@capacoa.ca

The Artsdata team can help you add or correct information.
