<p>{% include back-button.html %}</p>
{% include language-switcher.html %}

# Artsdata Organization Types Controlled Vocabulary

| <!-- --> | <!-- --> |
| - | - |
| Concept scheme | [adr:ArtsdataPlaceTypes](http://kg.artsdata.ca/resource/ArtsdataOrganizationTypes) |
| Version | 3.2 |
| Release date | August 2026 |

## Introduction

This page outlines the controlled vocabulary used in the Artsdata knowledge graph to describe organization types in the arts sector.

This vocabulary classifies organizations according to their primary economic activity. Concepts and their definitions are closely aligned with the [North American Industry Classification System](https://www23.statcan.gc.ca/imdb/p3VD.pl?Function=getVD&TVD=1369825). Concepts are mapped with closely matching concepts in [Schema](https://schema.org/), [Wikidata](https://www.wikidata.org/wiki/Wikidata:WikiProject_Performing_arts), and the [Art and Architecture Thesaurus](https://www.getty.edu/research/tools/vocabularies/aat/). 

In this vocabulary, the top-level concept [`adr:Organization`](http://kg.artsdata.ca/resource/Organization) is defined as “A structured group of people, united by a common purpose”. This includes both groups that are formally structured as a legal body (e.g., a not-for-profit corporation) as well as those that are informally structured, but otherwise act together. For example, a music band, a touring agency, an opera company and a presenting organization are all within the scope of this vocabulary.

## Artsdata Organization Types

The list of types (SKOS concepts) can be viewed in the [concept scheme](http://kg.artsdata.ca/resource/ArtsdataOrganizationTypes), in this [spreadsheet](https://docs.google.com/spreadsheets/d/1OhIjryL2UpnrkYNknbqM-CaSbhdTyVOn018mMkjvFn4/edit?usp=sharing), or in the table below.

| CURI | Preferred label | Close match | NAICS |
| - | - | - | - |
| [adr:Organization](http://kg.artsdata.ca/resource/Organization) | Organization | [schema:Organization](http://schema.org/Organization), [wd:Q43229](http://www.wikidata.org/entity/Q43229), [aat:300025948](http://vocab.getty.edu/page/aat/300025948) | |
| [adr:ArtsOrganization](http://kg.artsdata.ca/resource/ArtsOrganization) | Arts Organization |  |711 |
| [adr:PerformingArtsCompany](http://kg.artsdata.ca/resource/PerformingArtsCompany) | Performing Arts Company | [schema:PerformingGroup](http://schema.org/PerformingGroup), [wd:Q105815710](http://www.wikidata.org/entity/Q105815710) |7111 |
| [adr:TheatreCompany](http://kg.artsdata.ca/resource/TheatreCompany) | Theatre Company | [schema:TheaterGroup](http://schema.org/TheaterGroup), [wd:Q2416217](http://www.wikidata.org/entity/Q2416217), [aat:300266039](http://vocab.getty.edu/page/aat/300266039) |711111 |
| [adr:MusicalTheatreCompany](http://kg.artsdata.ca/resource/MusicalTheatreCompany) | Musical Theatre Company |  |711112 |
| [adr:OperaCompany](http://kg.artsdata.ca/resource/OperaCompany) | Opera Company | [wd:Q20819922](http://www.wikidata.org/entity/Q20819922), [aat:300386374](http://vocab.getty.edu/page/aat/300386374) |711112 |
| [adr:DanceCompany](http://kg.artsdata.ca/resource/DanceCompany) | Dance Company | [schema:DanceGroup](http://schema.org/DanceGroup), [wd:Q2393314](http://www.wikidata.org/entity/Q2393314), [aat:300400531](http://vocab.getty.edu/page/aat/300400531) |711120 |
| [adr:MusicGroup](http://kg.artsdata.ca/resource/MusicGroup) | Music Group | [schema:MusicGroup](http://schema.org/MusicGroup), [wd:Q2088357](http://www.wikidata.org/entity/Q2088357), [aat:300205024](http://vocab.getty.edu/page/aat/300205024) |711130 |
| [adr:CircusCompany](http://kg.artsdata.ca/resource/CircusCompany) | Circus Company | [wd:Q47928](http://www.wikidata.org/entity/Q47928) |711190 |
| [adr:ArtistRepresentative](http://kg.artsdata.ca/resource/ArtistRepresentative) | Artist Representative |  |711411 |
| [adr:PresentingOrganization](http://kg.artsdata.ca/resource/PresentingOrganization) | Presenting organization | [wd:Q7168296](http://www.wikidata.org/entity/Q7168296) |7113 |
| [adr:FestivalOrganization](http://kg.artsdata.ca/resource/FestivalOrganization) | Festival Organization | [wd:Q108669279](http://www.wikidata.org/entity/Q108669279) |711322 |
| [adr:ArtsServiceOrganization](http://kg.artsdata.ca/resource/ArtsServiceOrganization) | Arts Service Organization | [wd:Q2178147](http://www.wikidata.org/entity/Q2178147), [aat:300386369](http://vocab.getty.edu/page/aat/300386369) |813910 |
| [adr:ArtistUnion](http://kg.artsdata.ca/resource/ArtistUnion) | Artist Union |  |813930 |
| [adr:ArtMuseum](http://kg.artsdata.ca/resource/ArtMuseum) | Art Museum | [wd:Q3196771](http://www.wikidata.org/entity/Q3196771), [aat:300312302](http://vocab.getty.edu/page/aat/300312302) |712111 |
| [adr:CommunityOrganization](http://kg.artsdata.ca/resource/CommunityOrganization) | Community Organization | [wd:Q3269648](http://www.wikidata.org/entity/Q3269648) |813410 |
| [adr:EducationalOrganization](http://kg.artsdata.ca/resource/EducationalOrganization) | Educational Organization | [schema:EducationalOrganization](http://schema.org/EducationalOrganization), [wd:Q5341295](http://www.wikidata.org/entity/Q5341295) |611 |
| [adr:PerformingArtsSchool](http://kg.artsdata.ca/resource/PerformingArtsSchool) | Performing Arts School | [wd:Q7014642](http://www.wikidata.org/entity/Q7014642) |611610 |
| [adr:ArtSchool](http://kg.artsdata.ca/resource/ArtSchool) | Art School | [wd:Q383092](http://www.wikidata.org/entity/Q383092), [aat:300311640](http://vocab.getty.edu/page/aat/300311640) |611610 |
| [adr:PublicFunder](http://kg.artsdata.ca/resource/PublicFunder) | Public Funder | [wd:Q43228718](http://www.wikidata.org/entity/Q43228718) | |
| [adr:PublicArtsFunder](http://kg.artsdata.ca/resource/PublicArtsFunder) | Public Arts Funder |  | |
| [adr:Foundation](http://kg.artsdata.ca/resource/Foundation) | Foundation | [wd:Q157031](http://www.wikidata.org/entity/Q157031) | |
| [adr:ArtistRunCentre](http://kg.artsdata.ca/resource/ArtistRunCentre) | Artist-Run Centre | [wd:Q16020664](http://www.wikidata.org/entity/Q16020664) | |

## How to use

The Artsdata Organization Types Controlled Vocabulary can be populated with the `schema:additionalType` property, along with the generic `schema:Organization` class as the main type.  Thus, an organization entity in Artsdata can both have the type `schema:Organization`, and have an additional type from the Artsdata Event Controlled Vocabulary using the `schema:additionalType` property. 

Here is an example in JSON-LD:

```
"@context":"http://schema.org",
"@type": "Organization",
"additionalType": "http://kg.artsdata.ca/resource/PerformingArtsCompany"
```

## Version control

### Version 3.2

- Harmonized definitions, skos:related, and rdfs:seeAlso to take into account the new ado:LivePerformanceWork class and the Artsdata Genres vocabulary.
- Comments in definitions were transferred either to skos:scopeNote or skos:editorialNote.
- Fully implemented skos:closeMatch mappings withschema, Wikidata and AAT.
- Added NAICS mappings with schema:naics (note: skos concepts are not in domain for schema:naics).
- Changed a few labels
- Added the adr:ArtistRunCentre concept.
    - This concept is part of AGAC's vocabulary for the new Les Galeries platform. Since AGAC aims for interoperability with Artsdata, we should strive to meet them midways.
