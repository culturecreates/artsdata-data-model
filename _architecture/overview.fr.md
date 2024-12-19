---
title: Architecture Overview
layout: default
---
<p>{% include back-button.html %}</p>

<p>{% include architecture-languages.html %}</p>

Architecture Overview 
====================
**French coming soon:** How data flows in and out of Artsdata.ca. 
Click a circle in the image to learn more about it.

{% include architecture-diagram.html %}

### Detailed sections
<ul>
{% for page in site.architecture %}
  {% if page.layout == "architecture-doc" %}
   <li> <a href="{{ base }}{{ page.url }}"> {{ page.title}}</a></li>
  {% endif %}
{% endfor %}
</ul>

Summary
=========
Artsdata is a knowledge graph specialized in the Canadian Arts Sector, currently focused on performing arts events. 

Artsdata aggregates descriptive metadata related to cultural events (performing arts, and soon galleries and museums) from multiple websites and external databases and, when needed, mints URIs for named entities. Data is published as [Linked Open Data](https://en.wikipedia.org/wiki/Linked_data) with URIs that can be used to link events to artists, venues and arts organizations.

For an overview of knowledge graphs and why the arts sector in Canada should have one, take a look at this 6 minute [video](https://youtu.be/Brqa4T0JNMk) by Tammy Lee, CEO of Culture Creates. 

The Artsdata data model is implemented using classic RDF ontologies and maps data to a multitude of other classic (i.e. FRBR) and non-classic (i.e. Wikidata) ontologies.

The long term goal of Artsdata is to have the most complete and highest quality descriptive metadata on cultural events in Canada, including productions and artists from around the world being presented in Canada. And, at a later stage, all events of Canadian artists performing abroad.

The open data ecosystem is divided into 3 areas:
* Data providers
* Artsdata.ca
* Data consumers

### Data providers

For Data providers, such as arts organizations (producers, presenters, agents, venues) and artists, a range of ETL tools are available (see Provenance data for a listing of tools in action), as well as an API (Graph-store API) for 3rd party developers that accepts RDF data meeting all Artsdata data modelling requirements and constraints (SHACL defined in Artsdata.ca or ShEx when coming from Wikidata.)  All data submited to Artsdata.ca requires a user account registered with artsdata.ca. 

All data submitted to artsdata.ca is agreed upon by the registered account to be CC0.

Data from each source is loaded into its own graph within Artsdata.ca with provenance metadata including a contact point, contributor names and data related license agreements. 

3rd party developers are welcome and can use the Artsdata Databus API to load data.


### Artsdata.ca

 All services are open and freely accessible, except for loading data into Artsdata, which requires a user account.  In principle, anyone can load data using the Load API as long as they meet the Artsdata data model requirements outlined in the [Artsdata data model documentation](https://culturecreates.github.io/artsdata-data-model).

### Data consumers

Data consumers, such as listing sites, search engines, government bodies and Arts Organizations wanting to use the data, can call the Artsdata Query API that makes several methods available, from an iCalendar feed to a RESTful API, to a SPARQL endpoint (read only). Or they can obtain a triples data dump serialized in a variety of formats such as JSON-LD or N-Quads. The data from Artsdata.ca is CC0 and can be used in other applications without any restrictions.


