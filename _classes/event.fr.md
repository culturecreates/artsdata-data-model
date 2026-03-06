---
class_name: Event (fr)
layout: class-event-doc
nav_order: 100
title: Event (fr)
nav_exclude: true
---

# Événement

Dans Artsdata, un événement est défini comme « une activité organisée qui se déroule à un moment et un lieu précis ». La classe [`adr:Event`](http://kg.artsdata.ca/resource/Event) est considérée comme une classe équivalente à [`schema:Event`](https://schema.org/Event). 

Toute représentation unique, série de représentations ou édition d'un festival est considérée comme une entité du type `Event` ou `EventSeries` dans Artsdata.

## Types d'événement

Les entités du type Event peuvent être associées à des types supplémentaires à partir du [Vocabulaire contrôlé Artsdata pour les types d’événements](../event-types.fr.html), en utilisant la propriété `additionalType`.

Outre les concepts issus du vocabulaire contrôlé Artsdata, Artsdata accepte les sous-types d'événements Schema.org ainsi que les concepts Wikidata comme valeurs pour la propriété `additionalType`.

## Exigences minimales pour la création d'identifiants Artsdata pour les événements

Pour qu'Artsdata puisse créer automatiquement un identifiant unique et pérenne pour un événement, l'événement doit au minimum comporter les paires attribut-valeur suivantes :

- `@Type`: `Event` (ou un sous-type d'événement);
- `startTime`: valeur `dateTime` au format ISO 8601 (avec ou sans décalage de fuseau horaire);
- `location`: objet `Place` avec une adresse postale _complète_ et un lien [`sameAs`]({{ base }}/identifiers-guidelines/sameas.fr.html) vers un URI Wikidata ou Artsdata qui identife l'objet Place.

En l'absence d'une URI sous `location.sameAs`, Artsdata pourrait être en mesure d'utiliser `location.name`, `location.address.locality`, et/ou `location.address.postalCode` afin de réconcilier automatiquement ou manuellement (c.à.d. « reconnaître ») les entités du type Place et de les associer à leur URI Artsdata. De même, le code postale de l'objet Place est très utile pour identifier les doublons potentiels dans les entités du type Event, ce qui constitue un processus de validation important avant l'attribution d'un identifiant pérenne à un événement.

Si un objet Event ne répond pas entièrement à ces exigences, il est toujours possible d'attribuer manuellement un identifiant, à condition qu'au moins l'une des propriétés suivantes soit renseignée :
- `description`;
- `url`.

## Propriétés

| Propriété | Statut | Instructions |
| - | - | - |
| [startDate](http://schema.org/startDate) | Requis | Saisissez la date et l'heure de début de l'événement, au format [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601). Si possible, précisez le fuseau horaire en incluant le nombre d'heures de [décalage avec le temps universel coordonné (UTC)](https://nrc.canada.ca/fr/horloge-web/). Si ce n'est pas possible, alors il est préférable de ne saisir aucune valeur de fuseau horaire plutôt que de saisir une valeur factice (comme "+00:00") ou une valeur par défaut qui ne tiendrait pas compte des changements entre l'heure normale et l'heure avancée. En l'absence d'une valeur, le fuseau horaire présumé est l'heure locale. Si l'heure de début de l'événement est inconnue ou s'il s'agit d'un événement d'une journée entière, ne saisissez pas de valeur d'heure ni de valeur de fuseau horaire. |
| [location](http://schema.org/location) | Requis | Saisissez les informations identifiant et décrivant le lieu où l'événement se déroule. Dans le cas d'un lieu physique, la valeur devrait préférablement être l'entité la plus précise (par exemple, la salle plutôt que le bâtiment dans lequel elle est située). Pour des fins de désambiguïsation et de réconciliation des événements, il est fortement recommandé de renseigner l'URI Wikidata et/ou Artsdata du lieu sous la propriété `sameAs`. À défaut d'identifiants, une adresse postale complète – incluant le code postal et les abrévations postales de deux lettres pour la province/le territoire et le pays – peut faciliter la désambiguïsation. Pour plus d'informations, consultez ces [lignes directrices]({{ base }}/location.fr.html) |
| [name](http://schema.org/name) | Requis | Saisissez une appellation par laquelle l'événement est susceptible d'être recherché et reconnu. Il peut s'agir de la même valeur que le nom de l'artiste principal (`performer.name`) et/ou le nom de l'œuvre-spectacle (`workPerformed.name`), selon la notoriété de chacun. Tâchez de ne pas excéder une longueur de 60 caractères (pour des fins d'affichage dans les pages de résultats et dans les calendriers). N'ajoutez pas d'autres informations (comme le lieu ou la date). Au lieu, saisissez ces autres informations à l'aide des propriétés appropriées. Voir aussi `alternateName`. |
| [additionalType](http://schema.org/additionalType) | Recommandé | Saisissez des types supplémentaires correspondant au type particulier de l’événement. Référez-vous au [vocabulaire contrôlé Artsdata]({{ base }}/event-type.fr.html) pour identifier le ou les types les mieux appropriés parmi tous les types d’événements des arts de la scène. En guise de valeur par défaut, nous recommandons le type [adr:PerformingArtsEvent](http://kg.artsdata.ca/resource/PerformingArtsEvent), qui désigne une « représentation ». |
| [url](http://schema.org/url) | Recommandé | Saisissez l’URL canonique (c.-à-d. « officielle ») désignant la page web de l’événement sur le site de l’organisateur. |
| [description](http://schema.org/description) | Recommandé | Saisissez une courte description de l'événement. Ne répétez pas des informations factuelles tels que la date et le lieu. Ajoutez-les plutôt aux propriétés correspondantes. |
| [image](http://schema.org/image) | Recommandé | Identifiez l'image principale de la page d'événement. Il peut s'agir d'une URL ou d'un `ImageObject` entièrement décrit. Les propriétés recommandées pour un `ImageObject` imbriqué incluent : `contentUrl`, `creator`, `copyrightNotice`, `license`. Les propriétés suggerées incluent : `creditText` fournissant les attributions appropriées aux parties associées avec l'image (les interprètes, les concepteurs, la compagnie de production), `caption` et `description` fournissant une description « alt » de l'image. Pour plus d’informations, consultez la [Politique d’Artsdata relative aux images](https://kg.artsdata.ca/fr/doc/image-policy). |
| [organizer](http://schema.org/organizer) | Recommandé | Saisissez les informations identifiant et décrivant l’organisme qui est responsable de la présentation du spectacle. Il peut s’agir d’un organisme diffuseur ou alors d’une compagnie qui présente sa propre production (dans quel cas, la même entité sera aussi renseignées sous la propriété performer). Les propriétés recommandées pour l'entité imbriquée incluent : `name`, `url` et `sameAs` (pointant vers un identifiant Artsdata et/ou Wikidata). |
| [performer](http://schema.org/performer) | Recommandé | Saisissez les informations identifiant et décrivant la compagnie, le groupe ou le (les) artiste(s) qui est (sont) responsable de l’exécution de la représentation. Il est possible d’ajouter plusieurs performer(s). Les propriétés recommandées pour l'entité imbriquées incluent : `name`, URL et `sameAs` (pointant vers une URI ISNI, Artsdata et/ou Wikidata). Pour plus d'informations, consultez ces [lignes directrices]({{ base }}/performer.fr.html). |
| [workPerformed](http://schema.org/workPerformed) | Facultatif | Saisissez les informations identifiant et décrivant l'œuvre-spectacle exécutée lors de la représentation ou alors décrivant la ou des œuvres musicales, dramatiques, musicodramatiques intégrées à l'œuvre-spectacle. Les propriétés recommandées pour l'entité imbriquée incluent : `name`, `url`, `genre`, `inLanguage` et `sameAs` (pointant vers une URI Artsdata ou Wikidata). Si l'œuvre n'a pas d'identifiant Artsdata ou Wikidata, creator.`sameAs` peut être utilisé en guise d'alternative. |
| [offers](http://schema.org/offers) | Recommandé | Saisissez au moins une entité de type `Offer` ou `AggregateOffer` avec l'URL de la page où l'on peut se procurer les billets. Pour plus d'informations sur la façon de renseigner les offres, consultez le gabarit de données structurées d'événements Artsdata et la [documentation de Google](https://developers.google.com/search/docs/appearance/structured-data/event?hl=fr#structured-data-type-definitions) |
| [sameAs](http://schema.org/sameAs) | Facultatif | Saisissez les URI d'identifiants pérennes (par ex., Artsdata) et/ou les URL des réseaux sociaux (par ex., page d'événement Facebook) qui identifient sans ambiguïté l'événement. Saississez toujours l’URI complète de l’identifiant (plutôt que de saisir uniquement l’identifiant lui-même). Pour plus d'informations, consultez ces [lignes directrices]({{ base }}/identifiers-guidelines/sameas.fr.html). |
| [inLanguage](http://schema.org/inLanguage) | Facultatif | Identifiez la langue principale parlée, chantée et/ou signée lors de l'événement. Si plusieurs langues sont employées de manière significative au cours de l'événement, énumérez-les à l'intérieur de crochets. Voir aussi `subtitleLanguage`. |
| [endDate](http://schema.org/endDate) | Facultatif | Saisissez la date et l'heure de fin de l'événement, au format ISO 8601. Assurez-vous de préciser le fuseau horaire en incluant le nombre d'heures de décalage avec le temps universel coordonné (UTC). |
| [duration](http://schema.org/duration) | Facultatif | Saisissez la durée entre la date de début et la date de fin de l'événement, au format ISO 8601. |
| [eventAttendanceMode](http://schema.org/eventAttendanceMode) | Facultatif | Identifiez la manière dont les publics assistent à l'événement, telle qu'en ligne, hors ligne ou hybride. Pour la liste complète, consulter [`EventAttendanceModeEnumeration`](https://schema.org/EventAttendanceModeEnumeration). |
| [eventStatus](http://schema.org/eventStatus) | Facultatif | Identifiez l'état actuel de la programmation de l'événement, tel que programmé, annulé ou reprogrammé. Pour la liste complète, consulter [`EventStatusType`](https://schema.org/EventStatusType). |
| [alternateName](http://schema.org/alternateName) | Facultatif | Saisissez une appellation complémentaire à la valeur saisie sous `name` et qui conviendrait pour désigner un sous-titre de l'événement. Il peut s'agir du nom de l'œuvre-spectacle, de l'artiste principal ou de la compagnie. Il peut aussi s'agir du nom de l'artiste qui assure la première partie de la représention ou encore du nom du festival dans le cadre duquel est représenté l'événement. Ne saisissez pas de variante(s) d'épellation du nom déjà saisi sous `name`.  |
| [mainEntityOfPage](http://schema.org/mainEntityOfPage) | Facultatif | Saisissez l'URL d'une page d'un autre site web que celui de l'organisateur qui décrit le même événement que l'URL canonique. |
| [superEvent](http://schema.org/superEvent) | Facultatif | Si votre événement fait partie d'un événement plus grand, tel qu'un `Festival`, saisissez les informations identifiant et décrivant l'événement plus grand. |
| [subEvent](http://schema.org/subEvent) | Facultatif | Si votre événement est de type `EventSeries` et comporte une série de représentations d’un même spectacle, veuillez décrire chaque représentation comme une entité imbriquée sous la propriété `subEvent`. Si votre événement est de type `Festival` et que la page web canonique décrivant l'édition du festival sert aussi de page web canonique des spectacles qui y sont présentés (c.-à-d. que l'édition du festival et les représentations sont décrite sur une même page), veuillez décrire chaque représentation de spectacle en tant qu'entité imbriquée sous la propriété `subEvent`. |
