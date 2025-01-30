---
title: Architecture Sommaire
layout: default
---

<p>{% include back-button.html %}</p>

<p>{% include architecture-languages.html %}</p>

Sommaire
=========

L'écosystème de données ouvertes et liées d'Artsdata est composée de plusieurs parties que l'on peut regrouper en trois ensembles : 
* Fournisseurs de données :
* Graphe de connaissances Artsdata ;
* Consommateurs de données.

Voici un schéma illustrant cette architecture ainsi que les flux de données entre les différents ensembles.

{% include architecture-diagram.html %}

### Detail des éléments de l'architecture
<ul>
{% for page in site.architecture %}
  {% if page.layout == "architecture-doc" %}
   <li> <a href="{{ base }}{{ page.url }}"> {{ page.title}}</a></li>
  {% endif %}
{% endfor %}
</ul>

### Fournisseurs de données

Artsdata propose aux fournisseurs de données une diversité de processus et d’outils pour l’extraction-transformation-chargement (ETC) de leurs données :
* Moissonnage de données structurées JSON-LD ;
* Extraction frontale combinant moissonnage de JSON-LD et reconnaissance naturelle du langage ; 
* ETC par le biais de terminaux (APIs, JSON-LD) ;
* Google Sheet vers Artsdata (outil de conversion de données de chiffrier);
* Console Footlight (logiciel de gestion de données événementielles pour un seul site web) ;
* CMS Footlight (logiciel de gestion de données événementielles multisite) ;
* API de chargement Artsdata (API graph-store) qui accepte de données RDF satisfaisant aux exigences minimales d’Artsdata et aux SHACL (ou ShEx lorsque les données proviennent de Wikidata).

Le dépôt de données sur Artsdata exige un compte utilisateur Github enregistré auprès d’Artsdata.

Les données de chaque source sont déposées dans leur propre instance de graphe dédiée. Des métadonnées de provenance sont associées à chaque source, incluant le nom de la source, le nom de l’entité qui gère la source, les coordonnées d’une personne ressource, une évaluation du niveau d’autorité de la source sur les données et la licence attribuée aux données. Nous encourageons les développeurs à utiliser l’[API bus de données d’Artsdata](https://culturecreates.github.io/artsdata-data-model/architecture/graph-store-api.html) pour charger leurs données.

Toutes les données déposées sur Artsdata sont par défaut publiées sous la licence CC0.

Les fournisseurs de données d’Artsdata comprennent des associations, des syndicats, des billetteries, ainsi que des organismes artistiques ([voir la liste](https://kg.artsdata.ca/fr/query/show?sparql=feeds_all&title=Data+Feeds)).


### Graphe de connaissances Artsdata (kg.artsdata.ca)

Artsdata aggrège et partage des métadonnées descriptives à propos d’événements culturels (et des entités qui y sont associées) en provenance de multiples sites web et de bases de données. Les données sont publiées sous forme de données ouvertes et liées, c’est-à-dire avec des identifiants pérennes<--!HYPERLIEN VERS LA PAGE “ÊTRE BIEN IDENTIFIÉ”--> (exprimés sous forme d’URIs) qui permettent de lier des événements à des artistes, des lieux et des organismes.  

Le [modèle de données (ontologie) d’Artsdata](https://culturecreates.github.io/artsdata-data-model/index.fr.html) est représenté selon des ontologies RDF. Il est un sous-ensemble de Schema.org et s’aligne sur un grand nombre d’ontologies formelles (par exemple, LRMoo, DBpedia) et non-formelles (par exemple, Wikidata). 

Artsdata attribue ses propres identifiants pérennes (URIs) aux entités nommées lorsqu’elles satisfont aux exigences minimale pour l’attribution d’identifiants. Les utilisateurs enregistrés peuvent créer une URI Artsdata à partir d’une URI Wikidata. Artsdata s’appuie aussi sur des URIs externes (Wikidata, VIAF) pour désigner des entités nommées et des concepts.

Le [triplestore d’Artsdata](https://culturecreates.github.io/artsdata-data-model/architecture/triple-store.html), est un triplestore standard (conforme aux normes du W3C) utilisant le produit « GraphDB Free » de la compagnie OntoText.


### Consommateurs de données

Artsdata offre plusieurs modes d’accès pour les consommateurs de données désirant utiliser les données exposées par le biais d’Artsdata : 
* Naviguer l’interface du graphe de connaissances à [kg.artsdata.ca](https://kg.artsdata.ca/) ;
* Appeler l’[API de réconciliation](https://culturecreates.github.io/artsdata-data-model/architecture/reconciliation.html) pour récupérer les identifiants pérennes ;
* Déréférencer les identifiants pérennes pour récupérer les métadonnées associées au format JSON-LD ;
* Appeler l’[API de requête](https://culturecreates.github.io/artsdata-data-model/architecture/query-api.html) RESTfull d’Artsdata ; 
* S’abonner à un flux iCalendar personnalisé ;
* Effectuer une requête sur le terminal SPARQL d’Artsdata ;
* Télécharger un fichier cliché (c.-à-d., un “dump”) sérialisé dans divers formats tels que JSON-LD ou N-Quads.

Les données déposées sur Artsdata sont sous licence CC0 et peuvent être utilisées dans d’autres applications sans restriction.

Les consommateurs de données Artsdata comprennent des calendriers culturels, des plateformes qui soutiennent l’industrie des arts, des organismes de service aux arts, des gouvernements et des moteurs de recherche ([voir la liste](https://kg.artsdata.ca/fr/doc/data-consumers)). Pour un aperçu des cas d’usage, consultez nos récits utilisateur.<--! HYPERLIEN -->
