---
lang: fr
layout: default
nav_exclude: true
---
{% include base.html %}
{% include last-modified.html %}
{% include language-switcher.html %}

## Modèle de données Artsdata v{{ site.data.versions.schemaVersion }}
[Edit page](https://github.com/culturecreates/artsdata-data-model/blob/master/{{page.path}}) | <span id="last-modified"></span>

Un modèle de données pour représenter les événements, les œuvres, les lieux, les personnes et les organismes dans arts de la scène. 

Le modèle de données (ontologie) d’Artsdata est un sous-ensemble de Schema.org et d'autres ontologies avec quelques vocabulaires contrôlés additionnels. Le modèle d'Artsdata.ca est représenté formellement avec le language SHACL [ici](https://kg.artsdata.ca/query/show?sparql=https://raw.githubusercontent.com/artsdata-stewards/artsdata-actions/main/queries/artsdata_SHACL_validation_rules.sparql).

Les classes et propriétés utilisées dans Artsdata s'apparentent au modèle de [Données structurées d'événement de Google](https://developers.google.com/search/docs/appearance/structured-data/event?hl=fr). En particulier, les propriétés obligatoires pour les événements dans la documentation de Google sont aussi des propriétés obligatoires dans le modèle de données Artsdata. La différence principale est qu’Artsdata s'appuie sur les [identifiants pérennes](#identifiants-pérennes) pour lier les données d'Artsdata avec d'autres bases de connaissances ouvertes telles que Wikidata.

Voici les Classes utilisées dans Artsdata.

![Image](images/data-model-image.png)

[[open drawing tool](https://www.yworks.com/yed-live/?file=https://gist.githubusercontent.com/saumier/678866c150bdf24519892d68d640a904/raw/f1249bb614c7a659e683360cbbee2547c9d8f62b/artsdata_event_model)]

### Classes

<ol>
{% for class in site.classes %}
  {% unless class.nav_exclude %}
<li>
    <a href="{{ base }}{{ class.url }}">
        {{ class.class_name }}
    </a>
</li>
  {% endunless %}
{% endfor %}
</ol>

### Identifiants pérennes

Artsdata génère ses propres identifiants globaux uniques et pérennes (IRI aussi appelée URI) pour les entités des classes événements, spectacles, lieux, personnes et organisations, ainsi que pour les concepts de vocabulaires contrôlés. Ces URIs peuvent être utilisés en dehors d'Artsdata.

En plus de l'identifiant Artsdata, le graphe de connaissances Artsdata s'appuie sur d'autres [identifiants pérennes](https://www.artsdata.ca/fr/ressources/bien-identifie), comme l'identifiant Wikidata, l'ISNI et les identifiants locaux, afin de reconnaître, de réconcilier et lier les entités nommées. 

[Lignes directrices à propos des identifiants pérennes](https://docs.artsdata.ca/identifier-recommendations.fr.html)

### Vocabulaires contrôlés

- [Types d'événements]({{ base }}/event-types.fr.html)
  
- [Types d'organismes]({{ base }}/organization-types.fr.html)

- [Genres]({{ base }}/genres.fr.html)  

### Gabarits de données structurées

- [Gabarits pour les événements]({{ base }}/gabarits-jsonld/README.fr.html)

- [Gabarits pour les organismes]({{ base }}/gabarits-jsonld/organization)

- [Gabarits pour les personnes](https://docs.google.com/document/d/e/2PACX-1vRorpIgx1arsAqGuiR428j74uxk5K2V63f9yHgWn1C4CyqxH3mMk_Hw92JsGJBh4CKprGc9rG85Gfcn/pub)

### Rapports de validation SHACL

Les formes [SHACL]({{ base }}/shacl_reports.html) sont utilisées pour valider les données avant l’importation.

### Ontologies et inférences

Artsdata.ca utilise un ensemble de bases d’implications RDFS et OWL afin de permettre une inférence simple, appelé **OWL-Horst (optimized)**. 

La principale ontologie utilisée dans Artsdata.ca est **Schema.org**. Artsdata.ca importe le schéma de base Schema.org et le schéma Schema.org en attente (pour inclure schema:EventSeries qui est une classe en attente). Plusieurs autres ontologies sont utilisées, notamment DBpedia, DCAT, DATAID, PROV, SHACL, VANN, VoID, SKOS et Wikidata.

Artsdata.ca a un grand nombre de mappages de classes et de propriétés entre Schema.org, Wikidata.org, DBpedia.org, LRMoo, CIDOC-CRM, FRBRoo, AAT, FOAF et DOLCE+DnS Ultralite (Ontology Design Patterns) en utilisant owl:equivalentClass, owl:equivalentProperty, skos:exactMatch et skos:closeMatch. Certains mappages sont préconstruits à partir d’ontologies externes; d'autres sont définis dans Artsdata. 

#### Ontologies chargées dans Artsdata

* [https://www.w3.org/2000/01/rdf-schema](https://www.w3.org/2000/01/rdf-schema)
* [Ontologies externes](https://github.com/culturecreates/artsdata-data-model/tree/master/_triples)
* [Vocabulaires contrôlés par Artsdata](https://github.com/culturecreates/artsdata-data-model/tree/master/ontology)
    * [http://kg.artsdata.ca/resource/ArtsdataEventTypes](http://kg.artsdata.ca/resource/ArtsdataEventTypes)
    * [http://kg.artsdata.ca/resource/ArtsdataOrganizationTypes](http://kg.artsdata.ca/resource/ArtsdataOrganizationTypes)
    * [http://kg.artsdata.ca/resource/ArtsdataGenres](http://kg.artsdata.ca/resource/ArtsdataGenres)

### Provenance

En cours de traduction...

### Architecture des flux de données

En principe, n’importe qui peut ajouter des données à Artsdata.ca pourvu que certaines exigences en matière de données soient respectées. Voici un [diagramme]({{ base }}/architecture/overview.fr.html) sur la façon dont les données entrent et sortent d’Artsdata.ca.

### Données ouvertes et liées, mise en cache

Artsdata.ca charge les données ouvertes et liées de Wikidata et DBpedia afin de les mettre en cache pour des raisons de performances. Les triplets sont obtenus en utilisant la négociation de contenu (au lieu de vidages de données) et sont mis en cache sans modification dans leurs graphes nommés respectifs. 

**Remarque:** il existe une exception notable, la propriété Wikidata **P31** (instance de) est transformée en **rdf:type**.  Ce même résultat aurait pu être obtenu en utilisant owl:equivalentProperty mais il n’a pas été sélectionné pour des raisons de performances.

### Conventions de nommage

[Conventions]({{ base }}/naming_conventions.html) sur la façon de nommer les choses en cas de doute.

### Assistance ou contact

[Contactez nous](mailto:artsdata-support@capacoa.ca).
