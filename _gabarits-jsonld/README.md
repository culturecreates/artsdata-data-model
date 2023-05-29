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

Le gabarit _Événement_ est destiné à représenter les informations à propos d'événements uniques, c'est-à-dire un spectacle ayant une seule représentation. Si votre événement comporte une série de représentations d'un même spectacle, veuillez *ajouter* l'extension _Série d'événements_ au gabarit _Événement_ afin de décrire chaque représentation comme une _entité imbriquée_[^1] sous la propriété ['subEvent'](https://schema.org/subEvent), puis changez le type de l'événement principal pour ['EventSeries'](https://schema.org/EventSeries).

[^1]: Par __« entités imbriquées »__, on entend des entités liées à l'entité _Event_ par le biais des propriétés telles _organizer_, _performer_, _location_ ou _subEvent_. Ces entités sont des [choses](https://schema.org/Thing) à part entières dans le contexte Schema.org. Elles peuvent avoir un _@type_ différent de l'entité de premier niveau. Elles peuvent être décrites avec des pairs propriété-valeur au même titre que l'entité de premier niveau. En imbriquant ces entités à l'intérieur du code d'une entité de premier niveau à l'aide d'accolades `{ }` : on signifie que l'entité de premier niveau est l'entité principale; on décrit sémantiquement la relation entre l'entité de premier niveau et ses entités de second niveau; et on évite toute confusion à savoir si une pair propriété-valeur (par exemple, un nom ou une description) se rapporte à l'entité principale ou à une entité secondaire. Les entités imbriquées sont généralement représentées (dans le code et dans les visualisateurs JSON-LD) avec une indentation, cela afin de faciliter la lecture du code par les humains.

- [Gabarit Événement](https://github.com/culturecreates/artsdata-data-model/blob/master/_gabarits-jsonld/Event/event.jsonld) : événement unique (avec une seule représentation).

- [Extension pour les Séries d'événements](https://github.com/culturecreates/artsdata-data-model/blob/master/_gabarits-jsonld/Event/event_series.jsonld) : extension du gabarit _Événement_ pour décrire chaque représentation d'un même spectacle en tant qu'entités imbriquées.

## Détails sur certaines propriétés clés

### [_additionalType_](https://schema.org/additionalType)
Saisissez des types supplémentaires correspondant au type particulier de l’événement. Référez-vous au la [vocabulaire contrôlé Artsdata](http://kg.artsdata.ca/resource/ArtsdataEventTypes) pour identifier le ou les types les mieux appropriés parmi tous les types d'événements des arts de la scène. Vous pouvez ajouter autant de propriétés _additionalType_ que nécessaire pour bien décrire l'événement. En guise de valeur par défaut, nous recommandons le type [PerformingArtsEvent](http://kg.artsdata.ca/resource/PerformingArtsEvent), qui désigne « une œuvre des arts de la scène exécutée pour un public ».

### [_name_](https://schema.org/name)
Saisissez le titre de l’événement.

### _@id_
Saisissez une URI (Uniform Resource Identifier) constituant un identifiant unique pour cet événement à l'intérieur du domaine du site web. L'URI de l'événement doit être différente de l'URL de la page web de l'événement, puisqu'il s'agit de deux [_choses_](https://schema.org/Thing) (ou _entités_) distinctes dans le contexte des données structurées Schema.org. 

Dans le cas d'une série de représentations d'un même spectacle, en plus de l'URI de la série, une URI distincte devrait être assignée à chaque représentation à l'aide de l'[Extension pour les Séries d'événements](https://github.com/culturecreates/artsdata-data-model/blob/master/_gabarits-jsonld/Event/event_series.jsonld). Assurez-vous qu'aucun sous-événement ne se voit assigner la même l'URI que l'objet de type _EventSeries_.

Si vous n'êtes pas en mesure d'attribuer une URI pérenne à chaque événement, incluant chaque représentation d'une série de représentations, alors il est préférable de ne pas utiliser la propriété _@id_.[^2]

[^2]:Il est possible de générer une URI fonctionnelle en ajoutant à la suite de l'URL de la page web un carré (le symbole `#`) suivie d'une chaîne de caractère faisant office d'identifiant unique d'événement (on appelle cette chaîne de caractères un « [identificateur de fragment](https://fr.wikipedia.org/wiki/Identificateur_de_fragment) »). Voici un exemple fictif : `https://diffuseurdespectacles.ca/evenements/nomduspectacle/#e1324`. Dans cet exemple, l'URL de la page web est `https://diffuseurdespectacles.ca/evenements/nomduspectacle/`, alors que la chaîne de caractères `e1324` représente l'identifiant unique d'une représentation du spectacle dans le calendrier du site web. N'importe quelle chaîne de caractères peut convenir du moment où elle est unique à l'intérieur du domaine du site web. Ce pourrait être un identifiant local propre au CMS du site web et désignant la représentation dans la base de données du système. Ce pourrait aussi être la date et l'heure de la représentation. Il n'est pas nécessaire qu'un point d'ancrage soit réellement présent dans le corps de la page web : du moment où le carré et une chaîne de caractères unique est ajoutée à l'URL de la page web, cela satisfait à l'exigence d'une URL canonique dans le contexte de Schema.org.

### [_url_](https://schema.org/url)
Saisissez l'URL canonique désignant la page web de l'événement sur le site de l'organisateur. 

Dans le cas de séries de représentations, saisissez l'URL de la page web de chaque représentation si elle existe. Sinon saisissez, l'URL de la page web de la série de représentation.

### [_eventStatus_](https://schema.org/eventStatus)
Indiquez si un événement est [programmé](https://schema.org/EventScheduled) (avec date), [reporté](https://schema.org/EventPostponed) (date à confirmer), [reprogrammé](https://schema.org/EventRescheduled) (avec nouvelle date) ou [annulé](https://schema.org/EventCancelled).

### [_eventAttendanceMode_](https://schema.org/eventAttendanceMode)
Indiquez si un événement se produit [en personne](https://schema.org/OfflineEventAttendanceMode), [en ligne](https://schema.org/OnlineEventAttendanceMode), ou format [hybride](https://schema.org/MixedEventAttendanceMode).

### [_organizer_](https://schema.org/organizer)
Saisissez les informations identifiant et décrivant l'organisme qui est responsable de la présentation du spectacle. Il peut s'agir d'un organisme diffuseur ou d'une compagnie qui présente sa propre production. On peut ajouter plusieurs _organizer(s)_. Les _entitées imbriquées_[^1] sous cette propriété sont généralement de @type [Organization](https://schema.org/Organization).

### [_performer_](https://schema.org/performer)
Saisissez les informations identifiant et décrivant la compagnie, le groupe ou la (des) personne(s) qui est(sont) responsable de l'exécution de la représentation. Il est possible d'ajouter plusieurs _performer(s)_. Les entités imbriquées sous cette propriété peuvent être de @type [Organization](https://schema.org/Organization), [PerformingGroup](https://schema.org/PerformingGroup) ou [Person](https://schema.org/Person). 

### [_location_](https://schema.org/location)
Saisissez les informations identifiant et décrivant l'endroit où est présenté l'événement. L'entité imbriquée sous la propriété _location_ peut être de @type [Place](https://schema.org/Place) (un lieu physique) ou de @type [VirtualLocation](https://schema.org/VirtualLocation) (un lieu virtuel).

### [_offers_](https://schema.org/offers)
Saisissez les informations à propos de la disponibilité des billets et de la page Web où l'on peut se les procurer.

### [_sameAs_](https://schema.org/sameAs) (pour les entités imbriquées)
Saisissez les URIs d'_identifiants passerelles_[^3] permettant d'identifier sans ambiguité les entitées imbriquées dans l'entité de type _Event_. 

[^3]: Un __« identifiant passerelle »__ est un identifiant pérenne (c.-à-d. exprimé sous forme d'une URI permanente et résolvable) globalement unique qui est utilisé par plusieurs systèmes d'informations et qui facilite ainsi la réconciliation des entités (et, par le fait même, la circulation des données) entre ces systèmes. Les identifiants ISNI, Wikidata et Artsdata sont particulièrement pertinents dans le domaine du spectacle. Les URIs de ces identifiants sont résolvables vers des pages web et vers des métadonnées descriptives accessibles tant aux humains qu'aux machines. Pour de plus amples informations, consultez ces [recommandations à propos des identifiants pérennes dans les arts de la scène](https://docs.google.com/spreadsheets/d/1j2Be-KBZm4LioW3DH2NU7GR3m77boTeQcIHZe8OMK3U/edit?usp=sharing).

Saississez toujours l'URI complète de l'identifiant (plutôt que de saisir uniquement l'identifiant lui-même). Par exemple, pour l'identifiant Wikidata `Q596774` correspond l'URI http://www.wikidata.org/entity/Q596774 (prenez note que le format de l'URI diffère de l'URL de la page). Tant Wikidata, qu'ISNI et Artsdata ont des interfaces permettant une recherche par nom d'entité. La méthode pour récupérer l'URI associée à l'entité recherchée diffère cependant un peu dans chaque interface. Pour Wikidata, cliquez à droite sur le lien « Concept URI » dans le menu de gauche (sous la rubrique « Tools »), puis cliquez sur « copier l'adresse du lien ». Pour de plus amples informations, consultez ces [recommandations à propos des identifiants pérennes dans les arts de la scène](https://docs.google.com/spreadsheets/d/1j2Be-KBZm4LioW3DH2NU7GR3m77boTeQcIHZe8OMK3U/edit?usp=sharing). 

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






