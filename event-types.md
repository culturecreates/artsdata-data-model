<p>{% include back-button.html %}</p>
{% include event-type-languages.html %}

# Artsdata Controlled Vocabulary for Event Types

This page outlines the controlled vocabulary used in the Artsdata knowledge graph to describe event types in the performing arts sector.

The facets of an event which are considered in scope for differentiating event types in version 4.0 of this vocabulary are those facets which refer to the design, format, and/or functioning of a given performing arts event, rather than its artistic content.

Facets that are deemed “out of scope” for the Event type Controlled Vocabulary (such as language, audience, time of year, etc.) should be represented through other means, such as: using existing Schema properties and concepts; using existing Wikidata properties and concepts; using external controlled vocabularies; and/or, creating additional Artsdata controlled vocabularies.

### Event Types

The list of types (SKOS concepts) and the concept scheme can be view in the table below, or in the following [spreadsheet](https://docs.google.com/spreadsheets/d/1cwNQIHcU0iBUi2dLdh1tnOFDxrYCA-DKxnLiXrOXYug/edit?usp=sharing).

| CURI | Preferred label | Description |
| - | - | - |
| adr:Event | Event | An organized activity that occurs at a specific time and location. |
| adr:EventSeries | Event Series | A coherent series of individual events, shows, gatherings, and/or performances with organizational continuity. |
| adr:Class | Classes | An event series that provides a structured learning experience offered at a specific time and location. |
| adr:TalkEvent | Talk | An event in which one or more people speak in front of an audience. |
| adr:PerformingArtsEvent | Performance | An event during which a performing arts work is publically presented for an audience. |
| adr:RehearsalEvent | Public Rehearsal | An event where the process of creating a performance work and preparing for its performance is presented to the public. |
| adr:CircusPerformance | Circus Performance | A performance that involves a series of acts to display human skill, daring, humour, and/or tricks involving animals. |
| adr:ComedyPerformance | Comedy Performance | A performance featuring one or more comedians telling and/or acting out jokes intended to make an audience laugh. |
| adr:DancePerformance | Dance Performance | A performance featuring the execution of a dance work. |
| adr:MusicalTheatrePerformance | Musical Theatre Performance | A performance featuring the execution of a musico-dramatic work in the musical theatre genre, combining music, singing, and acting to tell a story. |
| adr:OperaPerformance | Opera Performance | A performance featuring the execution of a musico-dramatic work in the opera genre, combining singing, stagecraft, and narrative storytelling. |
| adr:MusicPerformance | Concert | A performance featuring the execution of a music work involving one or more artists singing and/or playing instruments. |
| adr:SpokenWordPerformance | Spoken Word Performance | A performance featuring poetry performed for an audience. |
| adr:TheatrePerformance | Theatre Performance | A performance in which actors realize a dramatic work written for the stage.  |
| adr:StorytellingPerformance | Storytelling Performance | A performance that uses words and actions to convey to an audience the elements and content of a specific narrative. |
| adr:VarietyPerformance | Variety Performance | A performance that features multiple performances of differing art media or genres.  |
| adr:PerformanceArt | Performance Art | A performance that produces an emphemeral performance work in the course of the work's execution. |
| adr:Festival | Festival | An event with an organized set of activities focused on a theme that lasts anywhere from several hours to weeks. |
| adr:ChildrensEvent | Children's Event | An event featuring educational and/or artistic content suitable for all-ages. |
| adr:ExhibitionEvent | Exhibition | An event where a collection of curated objects are grouped together according to some theme for the purpose of being presented to the public. |
| adr:ResidencyEvent | Residency | An event in which an arts organization sponsors one or more artists and supports their work by providing access to the resources the organization has at its disposal. |
| adr:ScreeningEvent | Screening | An event that presents film or video content to an audience. |
| adr:SocialEvent | Social Event | An event organized for a group of people to meet and/or interact with each other. |
| adr:WorkshopEvent | Workshop | An event where people learn about and/or practice a specific subject or activity. |
| adr:MasterclassEvent | Masterclass | A workshop event featuring an expert in a specific medium teaching and/or counselling other artists in the same medium, and providing newer artists with the benefit of the expert's experience.  |
| adr:PostshowTalk | Postshow Talk | An event featuring artists talking to or with an audience after a performance. |
| adr:PreshowTalk | Preshow Talk | An event featuring artists talking to or with an audience before a performance. |
| adr:PowWow | Powwow | A festival held by North American Indigenous communities following specific ceremonial protocols and featuring dancing, singing, and drumming. |
| adr:Competition | Competition | An event in which people compete against each other for prizes. |
| adr:Convention | Convention | An event series consisting of live speaking activities, including lectures, workshops, and/or social events. |
| adr:SocialDance | Social Dance | A social event in which people gather to dance together in a structured or informal setting. |
| adr:AwardsEvent | Awards Event | A social event in which one or several people, organizations, groups or works are bestowed distinctions.  |
| adr:LiveFilmConcert | Live Film Concert | A screening event in which live musicians perform a film’s soundtrack in real time. |
| adr:FestivalSeries | Festival Series | An event series of repeating festivals. |
| adr:SaleEvent | Sale | An event where art and/or cultural products are bought and sold. |

### How to use

The Artsdata Event Type controlled vocabulary is used along with the schema.org Event type.  An Event in Artsdata is a http://schema.org/Event (schema:Event or schema:EventSeries) and optionally an additional type from the Artsdata Event Controlled Vocabulary using the schema:additionalType property.

For example: 
```
ex:Event1 a schema:Event ; 
schema:additionalType <http://kg.artsdata.ca/resource/PerformingArtsEvent> .
```

To implement schema:Event and schema:additionalType properties in your structured data, please consult Artsdata's [structured data templates](https://culturecreates.github.io/artsdata-data-model/gabarits-jsonld/README.html).

### Key Changes in Version 4.0

The Artsdata team has defined Version 4.0 of Artsdata’s controlled vocabulary for event types, in consultation with the Artsdata community group (see the [project report](https://docs.google.com/document/d/1XMi70zjJBwu_dMSPUhf_Po6pymYcOUvgSQxXwW9vXO4/edit?usp=sharing) ). 

The Artsdata Event types Controlled Vocabulary Version 4.0 marks a major step forward in aligning our data with sector best practices and enhancing semantic clarity. Initiated in response to widespread inconsistencies and conceptual overlaps in the previous version, this overhaul introduces a format-based categorization model that better supports linked open data applications and digital discoverability.

[This document](https://docs.google.com/document/d/1nvSysesvUv_ksaR31YaVhx0gHEHQySzjWwRr-zC7Cow/edit?usp=sharing) describes the guidelines that the Artsdata team followed in redesigning Artsdata’s controlled vocabulary for Event types, as well as the key changes made in Version 4.0.

Version 4.0 represents a significant overhaul compared to Version 3.4.5.

Genre-based types were deprecated. Although certain Event types were deprecated, their URIs will remain accessible for users of Version 3.4.5. A few discipline-based types were grandfathered in version 4.0, but are now annotated as “proposed for deprecation” in a subsequent version of the vocabulary.

Similarly, all `skos:exactMatch` semantic relationships with the Scène Pro discipline/genre taxonomy were removed.

New types were added, including PowWow, Competition, SaleEvent, SocialDance, AwardsEvent, Live Film Concert, FestivalSeries and TalkEvent.

URIs were changed for the following concepts: `adr:StorytellingPerformance` (from `Storytelling`), `adr:VarietyPerformance` (from `VarietyShow`), `adr:Class` (from `Classes`), `adr:TalkEvent` (from `Conference`) and `adr:ResidencyEvent` (from `ResidencyActivity`).

Due to confusion surrounding altLabels during community feedback, this overhaul added the skos:hiddenLabel property, and began using this property along with skos:altLabels.

Labels and definitions were harmonized to make terminology and syntax consistent.

Some eventType definitions now include scope notes with the property “skos:scopeNote” to provide “encyclopedic” information useful to the user, as well as “skos:editorialNote” to convey background information about reasoning and possible future edits predicted for Version 5.0.

The subclass hierarchy for certain types was updated. For example, PreshowTalk and PostshowTalk became subclasses of a new TalkEvent class.

A spreadsheet detailing all the changes made between Version 3.4.5 and Version 4.0 can be found [here](https://docs.google.com/spreadsheets/d/1cwNQIHcU0iBUi2dLdh1tnOFDxrYCA-DKxnLiXrOXYug/edit?usp=sharing).
