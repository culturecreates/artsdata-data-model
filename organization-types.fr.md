---
nav_exclude: true
lang: fr
---
<p>{% include back-button.html %}</p>
{% include language-switcher.html %}

# Vocabulaire contrôlé Artsdata des types d'organisations

| <!-- --> | <!-- --> |
| - | - |
| Schéma de concepts | [adr:ArtsdataOrganizationTypes](http://kg.artsdata.ca/resource/ArtsdataOrganizationTypes) |
| Version | 3.2 |
| Date de publication | Août 2026 |

## Introduction

Cette page présente le vocabulaire contrôlé utilisé dans le graphe de connaissances Artsdata pour décrire les types d'organisations dans le secteur des arts. 

Ce vocabulaire classe les organisations selon leur activité économique principale. Les concepts et leurs définitions sont étroitement alignés avec la [Système de classification des industries de l'Amérique du Nord](https://www23.statcan.gc.ca/imdb/p3VD_f.pl?Function=getVD&TVD=1369825). Les concepts de ce vocabulaire sont mis en correspondance avec les vocabulaires suivants : [Schema.org](https://schema.org/), [Wikidata](https://www.wikidata.org/wiki/Wikidata:WikiProject_Performing_arts) et [Art and Architecture Thesaurus](https://www.getty.edu/research/tools/vocabularies/aat/).

Dans ce vocabulaire, le concept de premier niveau, [`adr:Organization`](http://kg.artsdata.ca/resource/Organization), est définit comme : « Un groupe structuré de personnes, unies par un objectif commun. » Il peut s'agir aussi bien de groupes structurés officiellement comme une entité juridique (par exemple, une entreprise à but non lucratif) et de groupes structurés de manière informelle, mais qui par ailleurs agissent ensemble. Par exemple, les groupes de musique, les agences de tournée et les compagnies d'opéra sont des concepts spécifiques qui ont adr:Organization comme concept générique.

## Types d'organisations Artsdata

| CURI | Libellé préféré | Correspondance approximative | SCIAN |
| - | - | - | - |
| [adr:Organization](http://kg.artsdata.ca/resource/Organization) | Organisation | [schema:Organization](http://schema.org/Organization), [wd:Q43229](http://www.wikidata.org/entity/Q43229), [aat:300025948](http://vocab.getty.edu/page/aat/300025948) | |
| [adr:ArtsOrganization](http://kg.artsdata.ca/resource/ArtsOrganization) | Organisation artistique | | 711 |
| [adr:PerformingArtsCompany](http://kg.artsdata.ca/resource/PerformingArtsCompany) | Compagnie en arts de la scène | [schema:PerformingGroup](http://schema.org/PerformingGroup), [wd:Q105815710](http://www.wikidata.org/entity/Q105815710) | 7111 |
| [adr:TheatreCompany](http://kg.artsdata.ca/resource/TheatreCompany) | Compagnie de théâtre | [schema:TheaterGroup](http://schema.org/TheaterGroup), [wd:Q2416217](http://www.wikidata.org/entity/Q2416217), [aat:300266039](http://vocab.getty.edu/page/aat/300266039) | 711111 |
| [adr:MusicalTheatreCompany](http://kg.artsdata.ca/resource/MusicalTheatreCompany) | Compagnie de comédies musicales | | 711112 |
| [adr:OperaCompany](http://kg.artsdata.ca/resource/OperaCompany) | Compagnie d'opéra | [wd:Q20819922](http://www.wikidata.org/entity/Q20819922), [aat:300386374](http://vocab.getty.edu/page/aat/300386374) | 711112 |
| [adr:DanceCompany](http://kg.artsdata.ca/resource/DanceCompany) | Compagnie de danse | [schema:DanceGroup](http://schema.org/DanceGroup), [wd:Q2393314](http://www.wikidata.org/entity/Q2393314), [aat:300400531](http://vocab.getty.edu/page/aat/300400531) | 711120 |
| [adr:MusicGroup](http://kg.artsdata.ca/resource/MusicGroup) | Groupe de musique | [schema:MusicGroup](http://schema.org/MusicGroup), [wd:Q2088357](http://www.wikidata.org/entity/Q2088357), [aat:300205024](http://vocab.getty.edu/page/aat/300205024) | 711130 |
| [adr:CircusCompany](http://kg.artsdata.ca/resource/CircusCompany) | Compagnie de cirque | [wd:Q47928](http://www.wikidata.org/entity/Q47928) | 711190 |
| [adr:ArtistRepresentative](http://kg.artsdata.ca/resource/ArtistRepresentative) | Représentant d'artistes | | 711411 |
| [adr:PresentingOrganization](http://kg.artsdata.ca/resource/PresentingOrganization) | Organisme de diffusion | [wd:Q7168296](http://www.wikidata.org/entity/Q7168296) | 7113 |
| [adr:FestivalOrganization](http://kg.artsdata.ca/resource/FestivalOrganization) | Organisme de festival | [wd:Q108669279](http://www.wikidata.org/entity/Q108669279) | 711322 |
| [adr:ArtsServiceOrganization](http://kg.artsdata.ca/resource/ArtsServiceOrganization) | Organisme de services aux arts | [wd:Q2178147](http://www.wikidata.org/entity/Q2178147), [aat:300386369](http://vocab.getty.edu/page/aat/300386369) | 813910 |
| [adr:ArtistUnion](http://kg.artsdata.ca/resource/ArtistUnion) | Syndicat d'artistes | | 813930 |
| [adr:ArtMuseum](http://kg.artsdata.ca/resource/ArtMuseum) | Musée d'art | [wd:Q3196771](http://www.wikidata.org/entity/Q3196771), [aat:300312302](http://vocab.getty.edu/page/aat/300312302) | 712111 |
| [adr:CommunityOrganization](http://kg.artsdata.ca/resource/CommunityOrganization) | Organisme communautaire | [wd:Q3269648](http://www.wikidata.org/entity/Q3269648) | 813410 |
| [adr:EducationalOrganization](http://kg.artsdata.ca/resource/EducationalOrganization) | Organisme éducatif | [schema:EducationalOrganization](http://schema.org/EducationalOrganization), [wd:Q5341295](http://www.wikidata.org/entity/Q5341295) | 611 |
| [adr:PerformingArtsSchool](http://kg.artsdata.ca/resource/PerformingArtsSchool) | École des arts de la scène | [wd:Q7014642](http://www.wikidata.org/entity/Q7014642) | 611610 |
| [adr:ArtSchool](http://kg.artsdata.ca/resource/ArtSchool) | École d'art | [wd:Q383092](http://www.wikidata.org/entity/Q383092), [aat:300311640](http://vocab.getty.edu/page/aat/300311640) | 611610 |
| [adr:PublicFunder](http://kg.artsdata.ca/resource/PublicFunder) | Bailleur de fonds public | [wd:Q43228718](http://www.wikidata.org/entity/Q43228718) | |
| [adr:PublicArtsFunder](http://kg.artsdata.ca/resource/PublicArtsFunder) | Bailleur de fonds public pour les arts | | |
| [adr:Foundation](http://kg.artsdata.ca/resource/Foundation) | Fondation | [wd:Q157031](http://www.wikidata.org/entity/Q157031) | |
| [adr:ArtistRunCentre](http://kg.artsdata.ca/resource/ArtistRunCentre) | Centre d'artistes autogéré | [wd:Q16020664](http://www.wikidata.org/entity/Q16020664) | |

## Comment utiliser

Le vocabulaire contrôlé Artsdata des types d'organisations peut être utilisé avec la propriété `schema:additionalType`, en combinaison avec la classe générique `schema:Organization` comme type principal. Ainsi, une entité de lieu dans Artsdata peut avoir à la fois le type `schema:Organization` et un type additionnel provenant du vocabulaire contrôlé Artsdata des types de lieux, au moyen de la propriété `schema:additionalType`.

Voici un exemple au format JSON-LD :

```
"@context":"http://schema.org",
"@type": "Organization",
"additionalType": "http://kg.artsdata.ca/resource/PerformingArtsCompany"
```

## Version control

### Version 3.2

[Issue #407](https://github.com/culturecreates/artsdata-data-model/issues/407)

- Harmonisation des définitions, skos:related et rdfs:seeAlso afin de prendre en compte la nouvelle classe ado:LivePerformanceWork et le Vocabulaire contrôlé des genres ;
- Les commentaires dans les définitions ont été transféré sous skos:scopeNote ou skos:editorialNote ;
- Mise en concordance complète avec Schema.org, Wikidata and AAT ;
- Ajout d'une mise en concordance avec SCIAN avec la propriété schema:naics ;
- Quelques changements à des libellés ;
- Ajout du concept adr:ArtistRunCentre ;
    - Ce concept fait partie du vocabulaire contrôlé de l'AGAC pour la nouvelle plateforme Les Galeries.
