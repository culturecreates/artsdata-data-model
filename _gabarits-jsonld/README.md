---
title: Gabarits de données structurées
layout: gabarits-doc
---


Gabarits de données structurées
=========================

Gabarits de données structurées au format JSON-LD s'appuyant sur le vocabulaire Schema.org.

Inspiré par le projet [Gabarits de données structurées de La danse sur les routes du Québec](https://github.com/a10s-ca/ladsr-ds/blob/main/README.md)

## Conventions

### Identification des valeurs à modifier dans le gabarit

Les gabarits sont rendus disponibles sous forme de fichier contenant des données au format JSON-LD.

Pour faciliter leur compréhension, des notes ou des explications ont été incluses comme valeur pour certaines clés. Lorsque c'est le cas, elles ont été placées entre de doubles tirets. Par exemple:

```
"url": "--URL complète vers la page Web concernée--"
```

Une fois le gabarit utilisé et rempli avec des données, il ne devrait plus contenir de doubles tirets. Par exemple:

```
"url": "https://placedesarts.com"
```

## Gabarit _Event_

Le gabarit _Event_ est utilisé pour les événements.

[Voir le gabarit](https://github.com/culturecreates/artsdata-data-model/blob/master/_gabarits-jsonld/Event/event.jsonld)

## Précisions

### Propriété _additionalType_
Entrer types suppementaires d’événements dans les arts de la scène. Faites référence à la vocabulaire contrôlé Artsdata pour les types d’événements dans les arts de la scène. Pouvoir ajouter plusieurs Propriétés _additionalType_.

### Propriété _name_
Entrer le titre de l’événement.

### Propriété _eventStatus_
Indiquer si un événement est-il programmé (avec date), reporté (date à confirmer), reprogrammé (avec nouvelle date) ou annulé.

### Propriété _eventAttendanceMode_
Indiquer si un événement se produit en ligne, hors ligne en personne ou se produit comme un hybride des deux.

### Propriété _organizer_
Entrer le nom de diffuseur. Cette propriété est un @type Organization  On peut ajouter plusieurs _organizer(s)_.

### Propriété _performer_
Entrer le nom de la compagnie ou personne qui fait la performance pendant l'événement.  Cette propriété peut être @type Organization ou @type Person. On peut ajouter plusieurs _performer(s)_. 

### Propriété _location_
Entrer le nom de lieu ou la salle d'événement. Propriété_location_ peut être un @type Place (un lieu physique) ou @type VirtualLocation (un lieu virtuel).






