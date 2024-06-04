---
title: Gabarits de données structurées d'événement
layout: gabarits-doc
---

Gabarits de données structurées
============================================

Gabarits de données structurées au format JSON-LD s'appuyant sur le vocabulaire Schema.org.

Inspiré par le projet Gabarits de données structurées de [La danse sur les routes du Québec](https://github.com/a10s-ca/ladsr-ds/blob/main/README.md)

## Conventions

### Identification des valeurs à modifier dans les gabarits

Les gabarits sont rendus disponibles sous forme de fichier contenant des données au format JSON-LD.

Afin de faciliter la compréhension et l'utilisation, des notes explicatives ont été incluses à propos des valeurs attendues et du format dans lequel elles devraient être saisie. Ces notes ont été placées entre de doubles tirets en français et anglais. Par exemple:

```
"url": "--URL complète vers la page Web concernée : Full URL to the relevant webpage--"
```

Une fois le gabarit utilisé et rempli avec des données, il ne devrait plus contenir de doubles tirets. Par exemple:

```
"url": "https://placedesarts.com"
```

## Gabarits

Le gabarit _Événement_ est destiné à représenter les informations à propos d'événements uniques, c'est-à-dire un spectacle ayant une seule représentation. Si votre événement comporte une série de représentations d'un même spectacle, veuillez *ajouter* l'extension _Série d'événements_ au gabarit _Événement_ afin de décrire chaque représentation comme une _entité imbriquée_[^1] sous la propriété ['subEvent'](https://schema.org/subEvent), puis changez le type de l'événement principal pour ['EventSeries'](https://schema.org/EventSeries).

[^1]: Par __« entités imbriquées »__, on entend des entités liées à l'entité _Event_ par le biais des propriétés telles _organizer_, _performer_, _location_ ou _subEvent_. Ces entités sont des [choses](https://schema.org/Thing) à part entières dans le contexte Schema.org. Elles peuvent avoir un _@type_ différent de l'entité de premier niveau. Elles peuvent être décrites avec des pairs propriété-valeur au même titre que l'entité de premier niveau. En imbriquant ces entités à l'intérieur du code d'une entité de premier niveau à l'aide d'accolades `{ }` : on signifie que l'entité de premier niveau est l'entité principale; on décrit sémantiquement la relation entre l'entité de premier niveau et ses entités de second niveau; et on évite toute confusion à savoir si une pair propriété-valeur (par exemple, un nom ou une description) se rapporte à l'entité principale ou à une entité secondaire. Les entités imbriquées sont généralement représentées (dans le code et dans les visualisateurs JSON-LD) avec une indentation, cela afin de faciliter la lecture du code par les humains.

- [Gabarit Événement](https://github.com/culturecreates/artsdata-data-model/blob/master/_gabarits-jsonld/Event/event.jsonld) : événement unique (avec une seule représentation).

- [Extension pour les Séries d'événements](https://github.com/culturecreates/artsdata-data-model/blob/master/_gabarits-jsonld/Event/event_series.jsonld) : extension du gabarit _Événement_ pour décrire chaque représentation d'un même spectacle en tant qu'entités imbriquées.

Dans le cas des festivals, vous pouvez utiliser un ou plusieurs des gabarits figurant dans le document suivant pour décrire l'édition du festival dans son ensemble, les jours spécifiques du festival et/ou les événements individuels au sein du festival :

- [Gabarits de festival](https://docs.google.com/document/d/1P-URop6G4fTTePSjyjnFowBTdQWb3zm5emkQ-q9KcK0/edit?usp=sharing) : L’édition du festival, le jour du festival et un événement individuel.

Veuillez noter que les gabarits de festival sont destinés à représenter des informations en lien avec l'édition spécifique d'un festival, par exemple [Édition 2023 : Festival Quartiers Danses](https://quartiersdanses.com/calendrier-2023/) (équivalent à [ado:Festival](http://kg.artsdata.ca/resource/Festival) et [wd:Q27968043](https://www.wikidata.org/wiki/Q27968043)). Ils ne sont pas destinés à représenter des informations sur le festival en tant qu'événement récurrent (équivalent à [wd:Q132241](https://www.wikidata.org/wiki/Q132241)) ou en tant qu'organisme (équivalent à [wd:Q108669279](http://www.wikidata.org/entity/Q108669279) et [ado:FestivalOrganization](http://kg.artsdata.ca/resource/FestivalOrganization)). Pour plus de détails à propos de ces différents concepts, veuillez consulter le [WikiProjet Cultural events](https://www.wikidata.org/wiki/Wikidata:WikiProject_Cultural_events/Data_structure).


## Détails sur certaines propriétés clés

### _@id_
Saisissez une URI (Uniform Resource Identifier) constituant un identifiant unique pour cet événement à l'intérieur du domaine du site web. L'URI de l'événement doit être différente de l'URL de la page web de l'événement, puisqu'il s'agit de deux [_choses_](https://schema.org/Thing) (ou _entités_) distinctes dans le contexte des données structurées Schema.org. 

Dans le cas d'une série de représentations d'un même spectacle, en plus de l'URI de la série, une URI distincte devrait être assignée à chaque représentation à l'aide de l'[Extension pour les Séries d'événements](https://github.com/culturecreates/artsdata-data-model/blob/master/_gabarits-jsonld/Event/event_series.jsonld). Assurez-vous qu'aucun sous-événement ne se voit assigner la même l'URI que l'objet de type _EventSeries_.

Dans le cas des festivals, il est recommandé d'attribuer à chaque événement une URI unique si tous les événements sont énumérés sur la même page web. 

Si vous n'êtes pas en mesure d'attribuer une URI à chaque événement, incluant chaque représentation d'une série de représentations, alors il est préférable de ne pas utiliser la propriété _@id_.[^2]

[^2]:Il est possible de générer une URI fonctionnelle en ajoutant à la suite de l'URL de la page web un carré (le symbole `#`) suivie d'une chaîne de caractère faisant office d'identifiant unique d'événement (on appelle cette chaîne de caractères un « [identificateur de fragment](https://fr.wikipedia.org/wiki/Identificateur_de_fragment) »). Voici un exemple fictif : `https://diffuseurdespectacles.ca/evenements/nomduspectacle/#e1324`. Dans cet exemple, l'URL de la page web est `https://diffuseurdespectacles.ca/evenements/nomduspectacle/`, alors que la chaîne de caractères `e1324` représente l'identifiant unique d'une représentation du spectacle dans le calendrier du site web. N'importe quelle chaîne de caractères peut convenir du moment où elle est unique à l'intérieur du domaine du site web. Ce pourrait être un identifiant local propre au CMS du site web et désignant la représentation dans la base de données du système. Ce pourrait aussi être la date et l'heure de la représentation. Il n'est pas nécessaire qu'un point d'ancrage soit réellement présent dans le corps de la page web : du moment où le carré et une chaîne de caractères unique sont ajoutés à l'URL de la page web, cela satisfait à l'exigence d'une URL canonique dans le contexte de Schema.org.

### [_additionalType_](https://schema.org/additionalType)
Saisissez des types supplémentaires correspondant au type particulier de l’événement. Référez-vous au [vocabulaire contrôlé Artsdata](http://kg.artsdata.ca/resource/ArtsdataEventTypes) pour identifier le ou les types les mieux appropriés parmi tous les types d'événements des arts de la scène. Vous pouvez ajouter autant de propriétés _additionalType_ que nécessaire pour bien décrire l'événement. En guise de valeur par défaut, nous recommandons le type [PerformingArtsEvent](http://kg.artsdata.ca/resource/PerformingArtsEvent), qui désigne « une œuvre des arts de la scène exécutée pour un public ».

### [_name_](https://schema.org/name)
Saississez une appellation par laquelle l'événement est susceptible d'être recherché et reconnu. Il peut s'agir de la même valeur que le nom de l'artiste principal (_performer.name_) et/ou le nom de l'œuvre-spectacle (_workPerformed.name_), selon la notoriété de chacun. Tâchez de ne pas excéder une longueur de 60 caractères (pour des fins d'affichage dans les pages de résultats et dans les calendriers). N'ajoutez pas d'autres informations (comme le lieu ou la date). Au lieu, saisissez ces autres informations à l'aide des propriétés appropriées.

Dans le cas des éditions des festivals, indiquez l’année dans le titre, et dans le cas des jours des festivals, indiquez la date ou le jour numéroté (par exemple, Jour 1).

### [_startDate_](https://schema.org/startDate)
Saisissez la date et l'heure de début de l'événement, au format [ISO 8601](https://fr.wikipedia.org/wiki/ISO_8601). 

Si possible, précisez le fuseau horaire en incluant le [nombre d'heures de décalage avec le temps universel coordonné (UTC)](https://nrc.canada.ca/fr/horloge-web/). Si ce n'est pas possible, alors il est préférable de ne saisir aucune valeur de fuseau horaire plutôt que de saisir une valeur factice (comme `+00:00`) ou une valeur par défaut qui ne tiendrait pas compte des changements entre l'heure normale et l'heure avancée. En l'absence d'une valeur, le fuseau horaire présumé est l'heure locale.
- Conseil : Le fuseau horaire est parfois hérité des paramètres généraux du site web. Si votre fuseau horaire apparaît comme `+00:00` sans que vous n'ayez vous-même renseigné cette valeur, vérifiez les paramètres de votre site web.

Si l'heure de début de l'événement est inconnue ou s'il s'agit d'un événement d'une journée entière, ne saisissez pas de valeur d'heure ni de valeur de fuseau horaire.

### [_location_](https://schema.org/location)
Saisissez les informations identifiant et décrivant l'endroit où est présenté l'événement. L'entité imbriquée sous la propriété _location_ peut être de @type [Place](https://schema.org/Place) (un lieu physique) ou de @type [VirtualLocation](https://schema.org/VirtualLocation) (un lieu virtuel).
Dans le cas des lieux physiques : 
- Il est préférable saisir les valeurs désignant l'entité la plus précise (par exemple, la salle plutôt que le bâtiment dans lequel elle est située).
- Pour des fins de désambiguïsation et de réconciliation des événements, il est fortement recommandé de renseigner l'URI Wikidata et/ou Artsdata du lieu sous la propriété _location.sameAs_.
- Google requiert la propriété _location.adress_ avec une entité de type _PostalAddess_. En effet, une adresse postale complète incluant le code postal peut faciliter la désambiguïsation.

Dans le cas des festivals, si le jour du festival et/ou l’édition du festival se déroule dans plusieurs lieux au sein d'une localité (c.-à-d. une ville ou une région), il est recommandé de renseigner la propriété _location.address_ en omettant les sous-propriétés _postalCode_ et _streetAddress_. 

### [_url_](https://schema.org/url)
Saisissez l'URL canonique (c.-à-d. l'URL « officielle ») désignant la page web de l'événement sur le site de l'organisateur. Dans le cas de séries de représentations, saisissez l'URL de la page web de chaque représentation si elle existe. Sinon saisissez, l'URL de la page web de la série de représentations.

Dans le cas des festivals, si l’édition du festival ou l’événement individuel du festival est décrit sur plusieurs pages web (par exemple, la page d'accueil, la page du programme complet et la page des activités quotidiennes), choisissez une URL de page comme URL canonique et indiquez cette même valeur d'URL dans les données structurées de chaque page.

### [_eventStatus_](https://schema.org/eventStatus)
Indiquez si un événement est [programmé](https://schema.org/EventScheduled) (avec date), [reporté](https://schema.org/EventPostponed) (date à confirmer), [reprogrammé](https://schema.org/EventRescheduled) (avec nouvelle date) ou [annulé](https://schema.org/EventCancelled).

### [_eventAttendanceMode_](https://schema.org/eventAttendanceMode)
Indiquez si un événement se produit [en personne](https://schema.org/OfflineEventAttendanceMode), [en ligne](https://schema.org/OnlineEventAttendanceMode), ou format [hybride](https://schema.org/MixedEventAttendanceMode).

### [_organizer_](https://schema.org/organizer)
Saisissez les informations identifiant et décrivant l'organisme qui est responsable de la présentation du spectacle ou du festival. Il peut s'agir d'un organisme diffuseur ou d'une compagnie qui présente sa propre production (dans quel cas, la même entité sera aussi renseignée sous la propriété _performer_). On peut ajouter plusieurs _organizer(s)_. Les _entitées imbriquées_[^1] sous cette propriété sont généralement de @type [Organization](https://schema.org/Organization). Les propriétés recommandées pour l'entité imbriquée incluent : _name_, _URL_ et _sameAs_ (pointant vers un identifiant Artsdata et/ou Wikidata).

### [_performer_](https://schema.org/performer)
Saisissez les informations identifiant et décrivant la compagnie, le groupe ou la (des) personne(s) qui est(sont) responsable de l'exécution de la représentation. Il est possible d'ajouter plusieurs _performer(s)_. Les entités imbriquées sous cette propriété peuvent être de @type [Organization](https://schema.org/Organization), [PerformingGroup](https://schema.org/PerformingGroup) ou [Person](https://schema.org/Person). Les propriétés recommandées pour l'entité imbriquée incluent : _name_, _URL_ et _sameAs_ (pointant vers un identifiant ISNI, Artsdata et/ou Wikidata).

### [_doorTime_](https://schema.org/doorTime)

Dans le cas des festivals, indiquez l'heure à laquelle commence l'admission au jour du festival et/ou à l'édition du festival, au format ISO 8601. Cette propriété est destinée à être utilisée lorsque l'ouverture des portes (_doorTime_) est différente de l'heure de début (_startTime_) du premier événement du programme du festival.

### [_offers_](https://schema.org/offers)
Saississez au moins une entité de type Offer ou AggregateOffer avec l'URL de la page où l'on peut se procurer les billets. Pour plus d'informations sur la façon de renseigner les offres, consultez la [documentation de Google](https://developers.google.com/search/docs/appearance/structured-data/event?hl=fr#structured-data-type-definitions).

### [_sameAs_](https://schema.org/sameAs)
Saisissez les URIs d'_identifiants passerelles_[^3] permettant d'identifier sans ambiguité l'événement et/ou les entitées imbriquées dans l'entité de type _Event_. 

[^3]: Un __« identifiant passerelle »__ est un identifiant pérenne (c.-à-d., exprimé sous forme d'une URI permanente et résolvable) globalement unique qui est utilisé par plusieurs systèmes d'informations et qui facilite ainsi la réconciliation des entités (et, par le fait même, la circulation des données) entre ces systèmes. Les identifiants ISNI, Wikidata et Artsdata sont particulièrement pertinents dans le domaine du spectacle. Les URIs de ces identifiants sont résolvables vers des pages web et vers des métadonnées descriptives accessibles tant aux humains qu'aux machines. Pour de plus amples informations, consultez ces [recommandations à propos des identifiants pérennes dans les arts de la scène](https://docs.google.com/spreadsheets/d/1j2Be-KBZm4LioW3DH2NU7GR3m77boTeQcIHZe8OMK3U/edit?usp=sharing).

Saississez toujours l'URI complète de l'identifiant (plutôt que de saisir uniquement l'identifiant lui-même). Par exemple, pour l'identifiant Wikidata `Q596774` correspond l'URI http://www.wikidata.org/entity/Q596774 (prenez note que le format de l'URI diffère de l'URL de la page). Tant Wikidata, qu'ISNI et Artsdata ont des interfaces permettant une recherche par nom d'entité. La méthode pour récupérer l'URI associée à l'entité recherchée diffère cependant un peu dans chaque interface. Pour Wikidata, cliquez à droite sur le lien « Concept URI » dans le menu de gauche (sous la rubrique « Tools »), puis cliquez sur « copier l'adresse du lien ». Pour de plus amples informations, consultez ces [recommandations à propos des identifiants pérennes dans les arts de la scène](https://docs.google.com/spreadsheets/d/1j2Be-KBZm4LioW3DH2NU7GR3m77boTeQcIHZe8OMK3U/edit?usp=sharing).

La propriété sameAs peut aussi être employée afin de saisir les URLs des pages d'événements associés à l'événement, et les URLs des comptes de médias sociaux associés à une entité.

Voici un exemple de code JSON-LD imbriquant une entité de @type [Person](https://schema.org/Person) décrite avec la propriété _sameAs_. Prenez note que, pour des fins de concisions, plusieurs propriétés pertinentes ont été exclues de cet exemple.

```
{
   "@context":"http://schema.org/",
   "@type":"Event",
   "@id":"https://somesite.ca/events/elisapie-isaac#2023-06-16T20:00:00",
   "name":"The Ballad of the Runaway Girl",
   "startDate":"2023-06-16T20:00:00-04:00",
   <!-- ... -->
   "performer":{
      "@type":"Person",
      "name":"Elisapie",
      "url":"https://www.elisapie.com",
      "sameAs":[
         "http://kg.artsdata.ca/resource/K12-438",
         "https://isni.org/isni/0000000002492038",
         "http://www.wikidata.org/entity/Q596774",
         "https://music.apple.com/artist/440813872"]
         },
   <!-- ... -->
}
```
