<p>{% include back-button.html %}</p>

{% include language-switcher.html %}

# Artsdata Place Types Controlled Vocabulary

| <!-- --> | <!-- --> |
| - | - |
| Concept scheme | [adr:ArtsdataPlaceTypes](http://kg.artsdata.ca/resource/ArtsdataPlaceTypes) |
| Version | 1.0.1 |
| Release date | February 2026 |

This page outlines the controlled vocabulary used in the Artsdata knowledge graph to describe place types in the arts sector. It classifies places according to their design, function and scope. It notably makes a distinction between entire buildings and interior spaces within buildings.

This controlled vocabulary is largely inspired by the typology of the [Wikidata WikiProject Cultural venues](https://wikidata.org/wiki/Wikidata:WikiProject_Cultural_venues/Typology). It imports concepts from Wikidata, the [Art and Architecture Thesaurus](https://www.getty.edu/research/tools/vocabularies/aat/), [Nomenclature](https://page.nomenclature.info/apropos-about.app) and [Schema](https://schema.org/). The concept [adr:PerformanceHall](http://kg.artsdata.ca/resource/PerformanceHall) is equivalent to the [Room class](https://documentation.datascene.ca/references/room/), in Datascène.

## Place Types

The list of types (SKOS concepts) can be viewed in the [concept scheme](http://kg.artsdata.ca/resource/ArtsdataPlaceTypes), in this [spreadsheet](https://docs.google.com/spreadsheets/d/1UtW5_tLdR72vf6WCZNPOmgJQ1SQGMc0xL8hRT3OAY9Y/edit?usp=sharing), or in the table below.

| CURI | Preferred label | Exact match | Close match |
| - | - | - | - |
| [adr:PlaceConcept](http://kg.artsdata.ca/resource/PlaceConcept) | Concept of a place | [schema:Place](https://schema.org/Place) | |
| [adr:CultureRecreationalStructure](http://kg.artsdata.ca/resource/CultureRecreationalStructure) | Cultural & Recreational Structures | [nom:659](https://nomenclature.info/nom/659), [aat:300424157](http://vocab.getty.edu/aat/300424157) | |
| [adr:CivicSocialStructure](http://kg.artsdata.ca/resource/CivicSocialStructure) | Civic & Social Structures | [nom:597](https://nomenclature.info/nom/597) | |
| [adr:EventVenue](http://kg.artsdata.ca/resource/EventVenue) | Event venue | [wd:Q18674739](http://www.wikidata.org/entity/Q18674739) | [schema:EventVenue](https://schema.org/EventVenue) |
| [adr:Complex](http://kg.artsdata.ca/resource/Complex) | Complex | [aat:300000202](http://vocab.getty.edu/aat/300000202), [wd:Q1497364](http://www.wikidata.org/entity/Q1497364) | |
| [adr:Structure](http://kg.artsdata.ca/resource/Structure) | Built work | [aat:300265418](http://vocab.getty.edu/aat/300265418), [wd:Q811979](http://www.wikidata.org/entity/Q811979) | |
| [adr:Building](http://kg.artsdata.ca/resource/Building) | Building | [wd:Q41176](http://www.wikidata.org/entity/Q41176), [dbpedia:Building](http://dbpedia.org/resource/Building), [aat:300004792](http://vocab.getty.edu/aat/300004792) | |
| [adr:InteriorSpace](http://kg.artsdata.ca/resource/InteriorSpace) | Interior space | [aat:300133704](http://vocab.getty.edu/aat/300133704) | [wd:Q1299240](http://www.wikidata.org/entity/Q1299240), [schema:Room](https://schema.org/Room) |
| [adr:PerformanceHall](http://kg.artsdata.ca/resource/PerformanceHall) | Performance hall | [wd:Q112688641](http://www.wikidata.org/entity/Q112688641) | [aat:300449028](http://vocab.getty.edu/aat/300449028) |
| [adr:ItalianTheatre](http://kg.artsdata.ca/resource/ItalianTheatre) | Italian theatre | [wd:Q18225059](http://www.wikidata.org/entity/Q18225059) | |
| [adr:ConcertHall](http://kg.artsdata.ca/resource/ConcertHall) | Concert hall | [wd:Q10547643](http://www.wikidata.org/entity/Q10547643) | |
| [adr:ComedyClub](http://kg.artsdata.ca/resource/ComedyClub) | Comedy club | [wd:Q2814066](http://www.wikidata.org/entity/Q2814066) | |
| [adr:BlackBox](http://kg.artsdata.ca/resource/BlackBox) | Black box theatre | [wd:Q201946](http://www.wikidata.org/entity/Q201946) | |
| [adr:TheatreInTheRound](http://kg.artsdata.ca/resource/TheatreInTheRound) | Theatre in the round | [wd:Q7777493](http://www.wikidata.org/entity/Q7777493) | |
| [adr:Cabaret](http://kg.artsdata.ca/resource/Cabaret) | Cabaret | [wd:Q131183](http://www.wikidata.org/entity/Q131183), [aat:300007099](http://vocab.getty.edu/aat/300007099) | |
| [adr:RehearsalSpace](http://kg.artsdata.ca/resource/RehearsalSpace) | Rehearsal room | [wd:Q1420179](http://www.wikidata.org/entity/Q1420179) | |
| [adr:MeetingSpace](http://kg.artsdata.ca/resource/MeetingSpace) | Meeting room | [wd:Q133821658](http://www.wikidata.org/entity/Q133821658) | [aat:300004398](http://vocab.getty.edu/aat/300004398), [schema:MeetingRoom](https://schema.org/MeetingRoom) |
| [adr:ExhibitionSpace](http://kg.artsdata.ca/resource/ExhibitionSpace) | Exhibition space | [wd:Q15206795](http://www.wikidata.org/entity/Q15206795), [aat:300240057](http://vocab.getty.edu/aat/300240057) | |
| [adr:PerformingArtsBuilding](http://kg.artsdata.ca/resource/PerformingArtsBuilding) | Performing arts building | [wd:Q57660343](http://www.wikidata.org/entity/Q57660343), [aat:300132484](http://vocab.getty.edu/aat/300132484) | |
| [adr:TheatreBuilding](http://kg.artsdata.ca/resource/TheatreBuilding) | Theatre building | [wd:Q24354](http://www.wikidata.org/entity/Q24354), [aat:300007117](http://vocab.getty.edu/aat/300007117) | |
| [adr:OperaHouse](http://kg.artsdata.ca/resource/OperaHouse) | Opera house | [wd:Q153562](http://www.wikidata.org/entity/Q153562), [aat:300007104](http://vocab.getty.edu/aat/300007104) | |
| [adr:Amphitheatre](http://kg.artsdata.ca/resource/Amphitheatre) | Amphitheatre | [wd:Q54831](http://www.wikidata.org/entity/Q54831), [aat:300007128](http://vocab.getty.edu/aat/300007128) | |
| [adr:PerformingArtsCentre](http://kg.artsdata.ca/resource/PerformingArtsCentre) | Performing arts centre | [wd:Q3469910](http://www.wikidata.org/entity/Q3469910) | |
| [adr:MusicVenue](http://kg.artsdata.ca/resource/MusicVenue) | Music venue | [wd:Q8719053](http://www.wikidata.org/entity/Q8719053), [schema:MusicVenue](https://schema.org/MusicVenue) | |
| [adr:NightClub](http://kg.artsdata.ca/resource/NightClub) | Night club | [wd:Q622425](http://www.wikidata.org/entity/Q622425) | |
| [adr:MovieTheatre](http://kg.artsdata.ca/resource/MovieTheatre) | Movie theatre | [wd:Q41253](http://www.wikidata.org/entity/Q41253), [aat:300007135](http://vocab.getty.edu/aat/300007135), [schema:MovieTheater](https://schema.org/MovieTheater) | |
| [adr:CulturalCentre](http://kg.artsdata.ca/resource/CulturalCentre) | Cultural centre | [aat:300005135](http://vocab.getty.edu/aat/300005135) | [wd:Q1329623](http://www.wikidata.org/entity/Q1329623) |
| [adr:CommunityCentre](http://kg.artsdata.ca/resource/CommunityCentre) | Community centre | [aat:300005120](http://vocab.getty.edu/aat/300005120) | [wd:Q77115](http://www.wikidata.org/entity/Q77115) |
| [adr:HouseOfCulture](http://kg.artsdata.ca/resource/HouseOfCulture) | House of culture | [wd:Q5061188](http://www.wikidata.org/entity/Q5061188) | |
| [adr:ConventionCentre](http://kg.artsdata.ca/resource/ConventionCentre) | Convention centre | [wd:Q1378975](http://www.wikidata.org/entity/Q1378975) | |
| [adr:Library](http://kg.artsdata.ca/resource/Library) | Library | [wd:Q856584](http://www.wikidata.org/entity/Q856584), [aat:300006824](http://vocab.getty.edu/aat/300006824), [nom:614](https://nomenclature.info/nom/614) | |
| [adr:SportsVenue](http://kg.artsdata.ca/resource/SportsVenue) | Sports venue | [wd:Q1076486](http://www.wikidata.org/entity/Q1076486) | |
| [adr:Stadium](http://kg.artsdata.ca/resource/Stadium) | Stadium | [wd:Q483110](http://www.wikidata.org/entity/Q483110) | |
| [adr:Arena](http://kg.artsdata.ca/resource/Arena) | Arena | [wd:Q641226](http://www.wikidata.org/entity/Q641226) | |
| [adr:OpenAirEventVenue](http://kg.artsdata.ca/resource/OpenAirEventVenue) | Open air event venue | [wd:Q117187730](http://www.wikidata.org/entity/Q117187730) | |
| [adr:FairGround](http://kg.artsdata.ca/resource/FairGround) | Fair ground | [wd:Q2948561](http://www.wikidata.org/entity/Q2948561) | |
| [adr:ExhibitionBuilding](http://kg.artsdata.ca/resource/ExhibitionBuilding) | Exhibition building | [nom:668](https://nomenclature.info/nom/668) | |
| [adr:MuseumBuilding](http://kg.artsdata.ca/resource/MuseumBuilding) | Museum building | [wd:Q24699794](http://www.wikidata.org/entity/Q24699794), [aat:300005768](http://vocab.getty.edu/aat/300005768), [nom:672](https://nomenclature.info/nom/672) | |
| [adr:ArtGallery](http://kg.artsdata.ca/resource/ArtGallery) | Art gallery | [aat:300005232](http://vocab.getty.edu/aat/300005232) | [wd:Q1007870](http://www.wikidata.org/entity/Q1007870), [schema:ArtGallery](https://schema.org/ArtGallery) |
| [adr:ReligiousBuilding](http://kg.artsdata.ca/resource/ReligiousBuilding) | Religious building | [wd:Q16970](http://www.wikidata.org/entity/Q16970), [aat:300007391](http://vocab.getty.edu/aat/300007391) | [nom:585](https://nomenclature.info/nom/585) |

### How to use

The Artsdata Place Type Controlled Vocabulary can be populated with the `schema:additionalType` property, along with the generic `schema:Place` class as the main type.  Thus, a place entity in Artsdata can both have the type `schema:Place`, and have an additional type from the Artsdata Event Controlled Vocabulary using the `schema:additionalType` property. 

Here is an example in Turtle in JSON-LD:

```
"@context":"http://schema.org",
"@type": "Place",
"additionalType": "http://kg.artsdata.ca/resource/PerformanceHall"
```
