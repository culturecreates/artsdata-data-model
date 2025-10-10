<p>{% include back-button.html %}</p>
<a href='sameas.html'><img src='https://img.shields.io/badge/lang-en-blue.svg'></a>
<a href='sameas.fr.html'><img src='https://img.shields.io/badge/lang-fr-green.svg'></a>

## Lignes directrices concernant la propriété sameAs et les URI

Tout comme la [propriété `@id`]({{ base }}/id.fr.html), la propriété [`schema:sameAs`](https://schema.org/sameAs) constitue un excellent moyen d’identifier sans ambiguïté toute _Chose_ dans les données structurées Schema.

Artsdata recommande de renseigner la propriété `sameAs` avec un identifiant pérenne. Veuillez toujours saisir l’identifiant sous forme d’URI complète plutôt qu’en forme courte. Par exemple, pour l’identifiant Wikidata `Q596774`, il faut saisir l’URI `http://www.wikidata.org/entity/Q596774`.

Artsdata recommande fortement les identifiants pérennes des bases de connaissances et des fichiers d’autorité ouverts (voir la [liste des identifiants supportés]({{ base }}/identifier-recommendations.fr.html)), car ces identifiants sont exploitables par machine : Artsdata peut déréférencer ces URI afin d’accéder à toutes les métadonnées descriptives qui y sont associées.

La propriété `sameAs` peut être utilisée autant pour des objets de premier niveau que pour les entités imbriquées. Dans l'exemple qui suit, la propriété `sameAs` est renseignée autant pour l'entité principale de type `Event`, au premier niveau, que pour les entités secondaires imbriquées sous les propriétés `location`, `organizer` et `performer` : 

```
{
    "@context": "https://kg.artsdata.ca/context.jsonld",
    "@type": "Event",
    "@id": "https://scenesfrancophones.ca/id/6130",
    "sameAs": "http://kg.artsdata.ca/resource/K43-1002",
    "name": "Maten - Utenat",
    "url": "https://scenesfrancophones.ca/spectacles/maten-utenat-6130",
    "startDateTime": "2025-05-01T19:30:00-03:00",
    "location": {
                "@type": "Place",
                "@id": "https://scenesfrancophones.ca/id/467",
                "name": "Théâtre Gilles-Laplante",
                "sameAs": "http://www.wikidata.org/entity/Q117093397",
                "address": {
                    "@type": "PostalAddress",
                    "streetAddress": "300, chemin Beaverbrook",
                    "addressLocality": "Miramichi",
                    "addressRegion": "NB",
                    "postalCode": "E1V 1A1",
                    "addressCountry": "CA"
                    },
                },
    "description": "Le groupe innu Maten est originaire de Mani-Utenam, sur la Côte Nord du Québec...",
    "image": "https://scenesfrancophones.ca/sites/default/files/styles/large/public/2024-07/Maten%20-%20Sf.png?itok=qjWZfzae",
    "organizer": {
                "@type": "Organization",
                "@id": "https://scenesfrancophones.ca/id/37",
                "name": "Carrefour communautaire Beausoleil",
                "sameAs": "http://www.wikidata.org/entity/Q133105414"
                },
    "performer": {
                "@type": "PerformingGroup",
                "@id": "https://scenesfrancophones.ca/id/6108",
                "name": "Maten",
                "sameAs": [
                        "https://isni.org/isni/0000000491339041",
                        "http://www.wikidata.org/entity/Q112681868"
                        ]
                }
}
```

Il est possible de renseigner plusieurs valeurs `sameAs` pour une même _Chose_, comme dans l'exemple précédent où l'on observe une plage de valeurs (délimitée par des crochets) pour l'entité "Maten" imbriquée sous la propriété `performer`. Cela n’est toutefois pas vraiment nécessaire. Une seule URI suffit, car elle peut être déréférencée afin de récupérer d’autres identifiants pérennes.

Les comptes de médias sociaux peuvent aussi être saisis sous la propriété `sameAs`. Cependant, cela n’est pas nécessaire. Si l’entité est identifiée par une URI Wikidata (ou une URI Artsdata liée à Wikidata), n’importe quel robot peut référencer cette URI et récupérer tous les comptes de médias sociaux ou de plateforme de contenu associés avec cette entité dans Wikidata. Autrement dit, si ces comptes sont renseignés dans Wikidata, les énumérer sous la propriété `sameAs` serait redondant d’un point de vue machine.

### Contenus complémentaires
- [Que sont les identifiants pérennes et pourquoi sont-ils importants ?](https://www.artsdata.ca/fr/ressources/bien-identifie)
- [Lignes directrices d’Artsdata à propos des identifiants pérennes]({{ base }}/identifier-recommendations.fr.html)
  - [Lignes directrices concernant la propriété @id et les URI locales]({{ base }}/id.fr.html)
  
