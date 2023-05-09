{% include base.html %}
{% include last-modified.html %}

[SCROLL DOWN FOR ENGLISH VERSION]

## Modèle de données Artsdata v{{ site.data.versions.schemaVersion }}

Un modèle de données simple pour les événements dans les arts de la scène ainsi que pour les lieux, les personnes et les organismes connexes. 

Vous êtes invités à faire part de vos commentaires et à examiner les problèmes actuels dans [GitHub](https://github.com/culturecreates/artsdata-data-model/issues). 

Il existe également un fichier [PDF](https://drive.google.com/file/d/19UDRPTyuFTfWzn4f0n6qm73e235o5uAL/view?usp=sharing) des données que [Footlight](https://console.artsdata.ca) alimente dans Artsdata. À l’heure actuelle, les données que Footlight publie sur les sites Web des organismes culturels et les données d’Artsdata sont très similaires. Alors que de plus en plus de sources alimentent Artsdata, la forme des données entre Footlight et Artsdata peut diverger, Footlight étant un sous-ensemble de classes et de propriétés collectées dans Artsdata.

Les classes et propriétés utilisées dans Artsdata représentent une couche « fine » de données spécifiées par [Google Event Structured Data](https://developers.google.com/search/docs/data-types/event). La différence est qu’Artsdata applique des liens entre les entités au sein d’Artsdata et relie les URI en dehors d’Artsdata, y compris des liens vers Wikidata et d’autres sources LOD (Linked Open Data). Artsdata génère également des identifiants globaux uniques pour des classes telles que Événement, Personne, Lieu et Organisation.

Voici les Classes utilisées dans Artsdata.

![Image](images/artsdata_event_model-2.png)

[[open drawing tool](https://www.yworks.com/yed-live/?file=https://gist.githubusercontent.com/saumier/9450de6c42ed8ceed27f0e4374d4e986/raw/0f15244c4f04486e237a8138e9132ed1aae96a66/artsdata_event_model)]

### Classes

<ol>
{% for class in site.classes %}
<li>
    <a href="{{ base }}{{ class.url }}">
        {{ class.class_name }}
    </a>
</li>
{% endfor %}
</ol>

### Gabarits
[Gabarits de données structurées]({{ base }}/gabarits-jsonld/README.html)

### Rapports de validation SHACL

Les formes [SHACL]({{ base }}/shacl_reports.html) sont utilisées pour valider les données avant l’importation.

### Ontologies et inférences

Artsdata.ca utilise un ensemble de bases d’implications RDFS et OWL afin de permettre une inférence simple, appelé **OWL-Horst (optimized)**. 

La principale ontologie utilisée dans Artsdata.ca est **Schema.org**. Artsdata.ca importe le schéma de base Schema.org et le schéma Schema.org en attente (pour inclure schema:EventSeries qui est une classe en attente).  

Artsdata.ca a un grand nombre de mappages de classes et de propriétés entre Schema.org, Wikidata.org, DBpedia.org, FOAF and DOLCE+DnS Ultralite (Ontology Design Patterns) en utilisant owl:equivalentClass and owl:equivalentProperty. La majorité des mappages sont préconstruits à partir d’ontologies externes avec quelques mappages supplémentaires spécifiques à [Artsdata.ca](http://kg.artsdata.ca/Wikidata_Mapping) à Wikidata. 

Les travaux en cours sur la prochaine version de l’ontologie Artsdata.ca sont influencés par les travaux de l’initiative [Un avenir numérique lié](https://linkeddigitalfuture.ca/fr/accueil/) de CAPACOA et impliquent l’alignement du modèle de données avec les modèles de données utilisés dans le patrimoine culturel, y compris, mais sans s’y limiter, CIDOC-CRM, FRBRoo, PROV et RDA. Les modèles de données seront en outre spécifiés par un vocabulaire spécifique au domaine qui sera publié dans les prochaines versions.

#### Ontologies chargées dans Artsdata
* [https://www.w3.org/2000/01/rdf-schema](https://www.w3.org/2000/01/rdf-schema)
* [Ontologies externes](https://github.com/culturecreates/artsdata-data-model/tree/master/_triples)
* [Vocabulaires contrôlés par Artsdata](https://github.com/culturecreates/artsdata-data-model/tree/master/ontology)

### Provenance

Les données sont excellentes, mais ce n’est pas la vérité ultime, et sans traçabilité, elles peuvent perdre notre confiance. Par exemple, que se passe-t-il si deux pages Web ont des dates différentes pour le même événement des arts de la scène ? Quelle source est la plus digne de confiance ? Comment pouvons-nous suivre les données jusqu’à la source pour décider nous-mêmes ? 

Afin de suivre la provenance, Artsdata.ca utilise des métadonnées attachées à des graphes nommés. Chaque source de données dans Artsdata.ca est stockée dans un graphe nommé distinct. L’URI du graphe est utilisé comme sujet des métadonnées de provenance.  Cette technique de suivi de la provenance est généralement appelée approche des **Graphes nommés (Named Graph)**. Chaque URI de graphe nommé est une prov:Entity et est lié à des métadonnées de provenance, y compris la date à laquelle les données ont été chargées, le logiciel utilisé pour les collecter et le courriel de l’organisation contributrice. Chaque fois que des données sont importées, que ce soit à partir d’un site Web, d’une feuille de calcul ou d’un triple magasin existant, les métadonnées de provenance des graphes sont mises à jour. De plus, lorsque la source de données provient directement d’une page Web analysée, l’entité schema:WebPage inclut la date à laquelle la page Web a été analysée. 

À l’avenir, nous passerons probablement à RDF\* (prononcé « étoile RDF ») afin d’avoir des données de provenance plus granulaires sur les déclarations individuelles.

### Architecture de flux de données

En principe, n’importe qui peut ajouter des données à Artsdata.ca pourvu que certaines exigences en matière de données soient respectées. Voici un [diagramme]({{ base }}/architecture/overview.html) sur la façon dont les données entrent et sortent d’Artsdata.ca.

### Données ouvertes et liées, mise en cache

Artsdata.ca charge les données ouvertes et liées de Wikidata et DBpedia afin de les mettre en cache pour des raisons de performances. Les triplets sont obtenus en utilisant la négociation de contenu (au lieu de vidages de données) et sont mis en cache sans modification dans leurs graphes nommés respectifs. 

**Remarque:** il existe une exception notable, la propriété Wikidata **P31** (instance de) est transformée en **rdf:type**.  Ce même résultat aurait pu être obtenu en utilisant owl:equivalentProperty mais il n’a pas été sélectionné pour des raisons de performances.

### Conventions de nommage

[Conventions]({{ base }}/naming_conventions.html) sur la façon de nommer les choses en cas de doute.

### Assistance ou contact

[Contactez nous](mailto:support@culturecreates.com).

#
#

## Artsdata Data Model v{{ site.data.versions.schemaVersion }}
[Edit page](https://github.com/culturecreates/artsdata-data-model/blob/master/{{page.path}}) | <span id="last-modified"></span>

A simple data model for Performing Arts Events and related Places, People and Organizations. 

You are welcome to give feedback and review current issues with [GitHub Issues](https://github.com/culturecreates/artsdata-data-model/issues). 

There is also a [PDF](https://drive.google.com/file/d/19UDRPTyuFTfWzn4f0n6qm73e235o5uAL/view?usp=sharing) of the data that [Footlight](https://console.artsdata.ca) feeds into Artsdata.  At the moment, the data that Footlight publishes on the websites of arts organizations and the data in Artsdata are very similar. As more and more sources feed into Artsdata, the shape of the data between Footlight and Artsdata may diverge, with Footlight being a subset of classes and properties collected in Artsdata.

The classes and properties used in Artsdata represent a “thin” layer of data roughly specified by [Google Event Structured Data](https://developers.google.com/search/docs/data-types/event).  The main difference is that Artsdata enforces links between entities within Artsdata and interlinks URIs outside of Artsdata including links to Wikidata and other LOD (Linked Open Data) sources.  Artsdata also generates unique global identifiers (IRIs also called URIs) for classes such as Event, Person, Place, and Organization.

Here are the main Classes used in Artsdata.

![Image](images/artsdata_event_model-2.png)

[[open drawing tool](https://www.yworks.com/yed-live/?file=https://gist.githubusercontent.com/saumier/9450de6c42ed8ceed27f0e4374d4e986/raw/0f15244c4f04486e237a8138e9132ed1aae96a66/artsdata_event_model)]

### Classes

<ol>
{% for class in site.classes %}
<li>
    <a href="{{ base }}{{ class.url }}">
        {{ class.class_name }}
    </a>
</li>
{% endfor %}
</ol>

### SHACL Validation Reports

[SHACL]({{ base }}/shacl_reports.html) shapes are used to validate data before importing.

### Ontologies & Inferencing

Artsdata.ca uses a basic set of RDFS and OWL entailments (or ruleset) to enable simple inferencing, called **OWL-Horst (optimized)**. 

The main ontology used in Artsdata.ca is **Schema.org**. Artsdata.ca imports the core Schema.org schema and the pending Schema.org schema (to include schema:EventSeries which is a pending class).  

Artsdata.ca has a large number of class and property mappings between Schema.org, Wikidata.org, DBpedia.org, FOAF and DOLCE+DnS Ultralite (Ontology Design Patterns) using owl:equivalentClass and owl:equivalentProperty. The majority of mappings come prebuilt from external ontologies with some additional [Artsdata.ca specific mappings](http://kg.artsdata.ca/Wikidata_Mapping) to Wikidata. 

Current work into the next version of the Artsdata.ca ontology is being influenced by the work at CAPACOA's [Linked Digital Future](https://linkeddigitalfuture.ca) initiative and involves aligning the data model with data models used in cultural heritage including, but not limited to, CIDOC-CRM, FRBRoo, PROV and RDA. The data models will be futher specificed by a domain-specifc vocabulary to be released in the upcoming versions.

#### Ontologies loaded into Artsdata
* [https://www.w3.org/2000/01/rdf-schema](https://www.w3.org/2000/01/rdf-schema)
* [External ontologies](https://github.com/culturecreates/artsdata-data-model/tree/master/_triples)
* [Artsdata controlled vocabularies](https://github.com/culturecreates/artsdata-data-model/tree/master/ontology)

### Provenance

Data is great, but it is not the ultimate truth, and without traceability it can lose our trust. For example, what if two web pages have different dates for the same performing arts event. Which source is more trust worthy? How can we follow the data back to the source to decide for ourselves? 

To track provenance, Artsdata.ca uses metadata attached to named graphs. Each data source in Artsdata.ca is stored in a separate named graph. The graph's URI is used as the subject of the provenance metadata.  This technique to track provenance is generally called the **Named Graphs** approach.  Each named graph URI is a prov:Entity and is linked to provenance metadata including the date when the data was loaded, the software used to collect it and the email of the contributing organization. Each time data is imported,  whether from a web site, spreadsheet or existing triple store, the graphs provenance metadata is updated. In addition, when the data source is directly from a crawled web page, the schema:WebPage entity includes the date when the web page was crawled. 

In the future, we will likely switch to RDF\* (pronounced "RDF star") in order to have more granular provenance data on individual statements.

### Data Flow Architecture

In principle, anyone can add data to Artsdata.ca as long as certain data requirements are met.  Here is a [diagram]({{ base }}/architecture/overview.html) about how data flows in and out of Artsdata.ca.

### Caching LOD

Artsdata.ca loads LOD from Wikidata and DBpedia in order to cache it for performance reasons. The triples are obtained using content negotiation (instead of data dumps) and are cached unmodified in their respective named graphs. 

**Note:** there is one notable exception, the Wikidata property **P31** (instance of) is transformed to **rdf:type**.  This same result could have been accomplished using owl:equivalentProperty but it was not selected for performance reasons.

### Naming Conventions

[Conventions]({{ base }}/naming_conventions.html) on how to name things when in doubt.

### Related Documents

1. [LDF/ANL Recommended identifiers](https://docs.google.com/spreadsheets/d/1j2Be-KBZm4LioW3DH2NU7GR3m77boTeQcIHZe8OMK3U/edit#gid=0): spreadsheet with guidelines on using identifiers. This document may eventually be converted into an Artsdata official recommendation.

### Support or Contact

[Contact support](mailto:support@culturecreates.com) and we’ll help you sort it out.
