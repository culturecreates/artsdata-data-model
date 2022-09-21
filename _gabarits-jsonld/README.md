---
title: Gabarits de données structurées - Structured Data Templates
layout: gabarits-doc
---

scroll down for english
========================

Français
==========
# Gabarits de données structurées

Gabarits de données structurées au format JSON-LD s'appuyant sur le vocabulaire Schema.org.

Inspiré par le projet Gabarits de données structurées de [La danse sur les routes du Québec](https://github.com/a10s-ca/ladsr-ds/blob/main/README.md)

## Conventions

### Identification des valeurs à modifier dans le gabarit

Les gabarits sont rendus disponibles sous forme de fichier contenant des données au format JSON-LD.

Afin de faciliter la compréhension et l'utilisation, des notes explicatives ont été incluses à propos des valeurs attendues et du format dans lequel elles devraient être saisie. Ces notes ont été placées entre de doubles tirets. Par exemple:

```
"url": "--URL complète vers la page Web concernée--"
```

Une fois le gabarit utilisé et rempli avec des données, il ne devrait plus contenir de doubles tirets. Par exemple:

```
"url": "https://placedesarts.com"
```

## Gabarit _Event_

Le gabarit _Event_ est destiné à représenter les informations à propos d'événements uniques, c'est-à-dire un spectacle ayant une seule représentation. Un gabarit pour les séries de représentations d'un même spectacle sera bientôt publié.

[Voir le gabarit](https://github.com/culturecreates/artsdata-data-model/blob/master/_gabarits-jsonld/Event/event.jsonld)

## Détails sur certaines propriétés clés

### [_additionalType_](https://schema.org/additionalType)
Saisissez des types supplémentaires correspondant au type particulier de l’événement. Référez-vous au la [vocabulaire contrôlé Artsdata](http://kg.artsdata.ca/resource/ArtsdataEventTypes) pour identifier le ou les types les mieux appropriés parmi tous les types d'événements des arts de la scène. Vous pouvez ajouter autant de propriétés _additionalType_ que nécessaire pour bien décrire l'événement. En guise de valeur par défaut, nous recommandons le type [PerformingArtsEvent](http://kg.artsdata.ca/resource/PerformingArtsEvent), qui désigne « une œuvre des arts de la scène exécutée pour un public ».

### [_name_](https://schema.org/name)
Saisissez le titre de l’événement.

### [_eventStatus_](https://schema.org/eventStatus)
Indiquez si un événement est [programmé](https://schema.org/EventScheduled) (avec date), [reporté](https://schema.org/EventPostponed) (date à confirmer), [reprogrammé](https://schema.org/EventRescheduled) (avec nouvelle date) ou [annulé](https://schema.org/EventCancelled).

### [_eventAttendanceMode_](https://schema.org/eventAttendanceMode)
Indiquez si un événement se produit [en personne](https://schema.org/OfflineEventAttendanceMode), [en ligne](https://schema.org/OnlineEventAttendanceMode), ou format [hybride](https://schema.org/MixedEventAttendanceMode).

### [_organizer_](https://schema.org/organizer)
Saisissez les informations identifiant et décrivant l'organisme qui est responsable de la présentation du spectacle. Il peut s'agir d'un organisme diffuseur ou d'une compagnie qui présente sa propre production. On peut ajouter plusieurs _organizer(s)_. Les entités décrites sous cette propriété sont généralement de @type [Organization](https://schema.org/Organization).

### [_performer_](https://schema.org/performer)
Saisissez les informations identifiant et décrivant la compagnie, le groupe ou la (des) personne(s) qui est(sont) responsable de l'exécution de la représentation. Il est possible d'ajouter plusieurs _performer(s)_. Les entités décrites sous cette propriété peuvent être de @type [Organization](https://schema.org/Organization), [PerformingGroup](https://schema.org/PerformingGroup) ou [Person](https://schema.org/Person). 

### [_location_](https://schema.org/location)
Saisissez les informations identifiant et décrivant l'endroit où est présenté l'événement. L'entité décrite sous la propriété _location_ peut être de @type [Place](https://schema.org/Place) (un lieu physique) ou de @type [VirtualLocation](https://schema.org/VirtualLocation) (un lieu virtuel).

### [_offers_](https://schema.org/offers)
Saisissez les informations à propos de la disponibilité des billets et de la page Web où l'on peut se les procurer.

English
========

# Structured Data Templates

Structured data templates in JSON-LD format based on the Schema.org vocabulary.

Inspired by the Structured Data Templates project of [La danse sur les routes du Québec](https://github.com/a10s-ca/ladsr-ds/blob/main/README.md)

## Conventions

### Identification of values to modify in the template

Templates are made available as a file containing data in JSON-LD format.

To facilitate understanding and use, explanatory notes have been included about the expected values and the format in which they should be entered. These notes have been placed between double dashes. For instance:

```
"url": "--URL complète vers la page Web concernée--"
```

Once the template is used and filled with data, it should no longer contain double dashes. For instance:

```
"url": "https://placedesarts.com"
```

## Template _Event_

The _Event_ template is intended to represent information about single events, ie a show having a single representation. A template for series of performances of the same show will soon be published.

[See the template](https://github.com/culturecreates/artsdata-data-model/blob/master/_gabarits-jsonld/Event/event.jsonld)

## Details on some key properties

### [_additionalType_](https://schema.org/additionalType)
Enter additional types corresponding to the particular type of event. Refer to the [Artsdata controlled vocabulary](http://kg.artsdata.ca/resource/ArtsdataEventTypes) to identify the most appropriate type(s) of all performing arts event types. You can add as many _additionalType_ properties as needed to properly describe the event. As a default, we recommend the type [PerformingArtsEvent](http://kg.artsdata.ca/resource/PerformingArtsEvent), which denotes « a performing arts work performed for an audience ».

### [_name_](https://schema.org/name)
Enter the title of the event.

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






