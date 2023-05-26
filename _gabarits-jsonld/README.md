---
title: Gabarits de données structurées - Structured Data Templates
layout: gabarits-doc
---

[Link to English Version](#english-version---structured-data-templates)
================================================================

Version française - Gabarits de données structurées
============================================

Gabarits de données structurées au format JSON-LD s'appuyant sur le vocabulaire Schema.org.

Inspiré par le projet Gabarits de données structurées de [La danse sur les routes du Québec](https://github.com/a10s-ca/ladsr-ds/blob/main/README.md)

## Conventions

### Identification des valeurs à modifier dans le gabarit

Les gabarits sont rendus disponibles sous forme de fichier contenant des données au format JSON-LD.

Afin de faciliter la compréhension et l'utilisation, des notes explicatives ont été incluses à propos des valeurs attendues et du format dans lequel elles devraient être saisie. Ces notes ont été placées entre de doubles tirets en français et anglais. Par exemple:

```
"url": "--URL complète vers la page Web concernée : Full URL to the relevant webpage--"
```

Une fois le gabarit utilisé et rempli avec des données, il ne devrait plus contenir de doubles tirets. Par exemple:

```
"url": "https://placedesarts.com"
```

## Gabarit

Le gabarit _Événement_ est destiné à représenter les informations à propos d'événements uniques, c'est-à-dire un spectacle ayant une seule représentation. Si votre événement comporte une série de représentations d'un même spectacle, veuillez *ajouter* l'extension _Série d'événements_ au gabarit _Événement_ afin de décrire chaque représentation comme un ['subEvent'](https://schema.org/subEvent), puis changez le type de l'événement principal pour ['EventSeries'](https://schema.org/EventSeries).

- [Gabarit Événement](https://github.com/culturecreates/artsdata-data-model/blob/master/_gabarits-jsonld/Event/event.jsonld) : événement unique (avec une seule représentation).

- [Extension pour les Séries d'événements](https://github.com/culturecreates/artsdata-data-model/blob/master/_gabarits-jsonld/Event/event_series.jsonld) : extension du gabarit _Événement_ pour décrire chaque représentation d'un même spectacle.

## Détails sur certaines propriétés clés

### [_additionalType_](https://schema.org/additionalType)
Saisissez des types supplémentaires correspondant au type particulier de l’événement. Référez-vous au la [vocabulaire contrôlé Artsdata](http://kg.artsdata.ca/resource/ArtsdataEventTypes) pour identifier le ou les types les mieux appropriés parmi tous les types d'événements des arts de la scène. Vous pouvez ajouter autant de propriétés _additionalType_ que nécessaire pour bien décrire l'événement. En guise de valeur par défaut, nous recommandons le type [PerformingArtsEvent](http://kg.artsdata.ca/resource/PerformingArtsEvent), qui désigne « une œuvre des arts de la scène exécutée pour un public ».

### [_name_](https://schema.org/name)
Saisissez le titre de l’événement.

### _@id_
Saisissez une URL canonique pour cet événement, c'est-à-dire une URI (Uniform Resource Identifier) constituant un identifiant unique pour cet événement. L'URI de l'événement devrait idéalement être différente de l'URL de la page web de l'événement, puisqu'il s'agit de deux [_choses_](https://schema.org/Thing) (ou _entités_) distinctes dans le contexte des données structurées Schema.

> Une façon simple de générer une URI distincte pour chaque événement consiste à ajouter à la suite de l'URL de la page web une ancre ***#*** suivie d'une chaîne de caractère servant d'identifiant unique d'événement. Voici un exemple fictif : `https://diffuseurdespectacles.ca/evenements/nomduspectacle/#1324`. Dans cet exemple, l'URL de la page web est `https://diffuseurdespectacles.ca/evenements/nomduspectacle/`, alors que la chaîne de caractères `1324` représenterait l'identifiant unique de l'événement. N'importe quelle chaîne de caractères peut convenir du moment où elle constitue une ancre unique à l'intérieur de la page web de l'événement. Ce pourrait être un identifiant local propre au CMS du site web et désignant l'événement dans la base de données du système. Ce pourrait aussi être la date et l'heure de la représentation. Il n'est pas nécessaire qu'un point d'ancrage soit réellement présent dans le corps de la page web : du moment où le symbole dièse et une chaîne de caractères unique est ajoutée à l'URL de la page web, cela satisfait à l'exigence d'une URL canonique dans le contexte de Schema.org.

Dans le cas de séries de représentations, en plus de l'URI  de la page web de la série, une URI distincte devrait être assignée à chaque représentation à l'aide de l'[Extension pour les Séries d'événements](https://github.com/culturecreates/artsdata-data-model/blob/master/_gabarits-jsonld/Event/event_series.jsonld). Si les différentes représentations ne disposent pas de leurs propres page web (en sus de la page de la série), il est tout de même possible de leur assigner des URI distinctes en ajoutant à l'URL de la page des ancres # suivies de la date et de l'heure de chaque représentation, tel qu'expliqué plus haut. Dans un tel scénario, assurez-vous que l'URI de l'objet de type _EventSeries_ soit disctincte des URIs des objets de type _SubEvent_.

### [_url_](https://schema.org/url)
Saisissez l'URL de la page web de l'événement sur le site de l'organisateur. 

### [_eventStatus_](https://schema.org/eventStatus)
Indiquez si un événement est [programmé](https://schema.org/EventScheduled) (avec date), [reporté](https://schema.org/EventPostponed) (date à confirmer), [reprogrammé](https://schema.org/EventRescheduled) (avec nouvelle date) ou [annulé](https://schema.org/EventCancelled).

### [_eventAttendanceMode_](https://schema.org/eventAttendanceMode)
Indiquez si un événement se produit [en personne](https://schema.org/OfflineEventAttendanceMode), [en ligne](https://schema.org/OnlineEventAttendanceMode), ou format [hybride](https://schema.org/MixedEventAttendanceMode).

### [_organizer_](https://schema.org/organizer)
Saisissez les informations identifiant et décrivant l'organisme qui est responsable de la présentation du spectacle. Il peut s'agir d'un organisme diffuseur ou d'une compagnie qui présente sa propre production. On peut ajouter plusieurs _organizer(s)_. Les _entitées imbriquées_[^1] sous cette propriété sont généralement de @type [Organization](https://schema.org/Organization).

[^1]: Par __« entités imbriquées »__, on entend des entités liées à l'entité _Event_ par le biais des propriétés telles _organizer_, _performer_ et _location_. Ces entités sont des [choses](https://schema.org/Thing) à part entières. Elles peuvent avoir un _@type_ différent de l'entité principale. Elles peuvent être décrites avec des pairs propriété-valeur au même titre que l'entité principale. En imbriquant ces entités à l'intérieur du code d'une entité principale à l'aide d'accolades `{ }` : on signifie que l'entité de premier niveau est l'entité principale; on décrit sémantiquement la relation entre l'entité de premier niveau et ses entités de second niveau; et on évite toute confusion à savoir si une pair propriété-valeur (par exemple, un nom ou une description) se rapporte à l'entité principale ou à une entité secondaire. Les entités imbriquées sont généralement représentées (dans le code et dans les visualisateurs JSON-LD) avec une indentation, cela afin de faciliter la lecture du code par les humains.

### [_performer_](https://schema.org/performer)
Saisissez les informations identifiant et décrivant la compagnie, le groupe ou la (des) personne(s) qui est(sont) responsable de l'exécution de la représentation. Il est possible d'ajouter plusieurs _performer(s)_. Les entités imbriquées sous cette propriété peuvent être de @type [Organization](https://schema.org/Organization), [PerformingGroup](https://schema.org/PerformingGroup) ou [Person](https://schema.org/Person). 

### [_location_](https://schema.org/location)
Saisissez les informations identifiant et décrivant l'endroit où est présenté l'événement. L'entité imbriquée sous la propriété _location_ peut être de @type [Place](https://schema.org/Place) (un lieu physique) ou de @type [VirtualLocation](https://schema.org/VirtualLocation) (un lieu virtuel).

### [_sameAs_](https://schema.org/sameAs)
Saisissez les URIs d'_identifiants passerelles_[^2] permettant d'identifier sans ambiguité les entitées imbriquées dans l'entité de type _Event_. 

[^2]: Un __« identifiant passerelle »__ est un identifiant pérenne (c.-à-d. exprimé sous forme d'URI résolvable) globalement unique qui est utilisé par plusieurs systèmes d'informations et qui facilite ainsi la réconciliation des entités (et, par le fait même, la circulation des données) entre ces systèmes. Les identifiants ISNI, Wikidata et Artsdata sont particulièrement pertinents dans le domaine du spectacle. Les URIs de ces identifiants sont résolvables vers des pages web et des métadonnées descriptives accessibles tant aux humains qu'aux machines.

Saississez toujours l'URI complète de l'identifiant (plutôt que de saisir uniquement l'identifiant lui-même). Par exemple, pour l'identifiant Wikidata Q596774 correspond l'URI http://www.wikidata.org/entity/Q596774 (prenez note que le format de l'URI diffère de l'URL de la page). Tant Wikidata, qu'ISNI et Artsdata ont des interfaces permettant une recherche par nom d'entité. La méthode pour récupérer l'URI associée à l'entité recherchée diffère cependant un peu dans chaque interface. Pour Wikidata, cliquez à droite sur le lien « Concept URI » dans le menu de gauche (sous la rubrique « Tools »), puis cliquez sur « copier l'adresse du lien ». Pour plus d'informations, consultez ces [recommandations à propos des identifiants pérennes dans les arts de la scène](https://docs.google.com/spreadsheets/d/1j2Be-KBZm4LioW3DH2NU7GR3m77boTeQcIHZe8OMK3U/edit?usp=sharing). 

### [_offers_](https://schema.org/offers)
Saisissez les informations à propos de la disponibilité des billets et de la page Web où l'on peut se les procurer.

English Version - Structured Data Templates
=====================================

Structured data templates in JSON-LD format based on the Schema.org vocabulary.

Inspired by the Structured Data Templates project of [La danse sur les routes du Québec](https://github.com/a10s-ca/ladsr-ds/blob/main/README.md)

## Conventions

### Identification of values to modify in the template

Templates are made available as a file containing data in JSON-LD format.

To facilitate understanding and use, explanatory notes have been included about the expected values and the format in which they should be entered. These notes have been placed between double dashes in French and in English. For example:

```
"url": "--URL complète vers la page Web concernée : Full URL to the relevant webpage--"
```

Once the template is used and filled with data, it should no longer contain double dashes. For instance:

```
"url": "https://placedesarts.com"
```

## Template

The _Event_ template is intended to represent information about single events, ie a show having a single representation. If your event has a series of performances of the same show, please *add* the _Event Series_ template to the _Event_ template to describe each individual performance as a ['subEvent'](https://schema.org/subEvent), and then change the top _Event_ type to ['EventSeries'](https://schema.org/EventSeries).

- [Event template](https://github.com/culturecreates/artsdata-data-model/blob/master/_gabarits-jsonld/Event/event.jsonld) - single events

- [Add-on for Event Series](https://github.com/culturecreates/artsdata-data-model/blob/master/_gabarits-jsonld/Event/event_series.jsonld) - add-on to Event template to include a series of performances of the same show

## Details on key properties

### [_additionalType_](https://schema.org/additionalType)
Enter additional types corresponding to the particular type of event. Refer to the [Artsdata controlled vocabulary](http://kg.artsdata.ca/resource/ArtsdataEventTypes) to identify the most appropriate type(s) of all performing arts event types. You can add as many _additionalType_ properties as needed to properly describe the event. As a default, we recommend the type [PerformingArtsEvent](http://kg.artsdata.ca/resource/PerformingArtsEvent), which denotes « a performing arts work performed for an audience ».

### [_name_](https://schema.org/name)
Enter the title of the event.

### [_url_](https://schema.org/url)
Enter the URL of the event webpage on the organizer's website. 
For series of performances, in addition to the URL of the series webpage, a distinct URL should be assigned to each performance using the [Add-on for Event Series](https://github.com/culturecreates/artsdata-data-model/blob/master/_gabarits-jsonld/Event/event_series.jsonld). If individual performances in the series do not have their own stand-alone webpages, unique URLs can be created by appending # anchors followed by the date of each performance.

### [_eventStatus_](https://schema.org/eventStatus)
Indicate whether an event is [scheduled](https://schema.org/EventScheduled) (with date), [postponed](https://schema.org/EventPostponed) (date to be confirmed), [rescheduled](https://schema.org/EventRescheduled) (with new date) or [cancelled](https://schema.org/EventCancelled).

### [_eventAttendanceMode_](https://schema.org/eventAttendanceMode)
Indicate if an event occurs [in person](https://schema.org/OfflineEventAttendanceMode), [online](https://schema.org/OnlineEventAttendanceMode), or is [hybrid](https://schema.org/MixedEventAttendanceMode), meaning both on and offline.

### [_organizer_](https://schema.org/organizer)
Enter information identifying and describing the organization that is responsible for presenting the show. It can be a presenter or a self-presenting company. You can add multiple _organizer(s)_. Entities described under this property are typically of @type [Organization](https://schema.org/Organization).

### [_performer_](https://schema.org/performer)
Enter information identifying and describing the company, group or person(s) who is(are) responsible for performing the performance. It is possible to add several _performer(s)_. The entities described under this property can be of @type [Organization](https://schema.org/Organization), [PerformingGroup](https://schema.org/PerformingGroup) or [Person](https://schema.org/Person). 

### [_location_](https://schema.org/location)
Enter the information identifying and describing the place where the event is presented (is happening). The entity described under the _location_ property can be @type [Place](https://schema.org/Place) (a physical space) or @type [VirtualLocation](https://schema.org/VirtualLocation) (a virtural space).

### [_offers_](https://schema.org/offers)
Enter information about ticket availability and the webpage where tickets can be purchased.






