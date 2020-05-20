{% include base.html %}

## Artsdata Data Model v{{ site.data.versions.schemaVersion}}

A simple data model for Performing Arts Events and related Places, People and Organizations. 

You are welcome to give feedback and review current issues with [GitHub Issues](https://github.com/culturecreates/artsdata-data-model/issues). 

There is also a [PDF](https://drive.google.com/open?id=10-bnlDKv7w7LREakZ9b40BajbY39gbhJ) of the data that [Footlight](https://www.culturecreates.com/en/index.html#vision) feeds into Artsdata.  At the moment, the data that Footlight publishes on websites of arts organizations and data in Artsdata are very similar, but as more and more sources feed into Artsdata, the shape of the data between Footlight and Artsdata may diverge, with Footlight being a subset of classes and properties collected in Artsdata.

The classes and properties used in Artsdata represent a “thin” layer of data
roughly specified by [Google Event Structured Data](https://developers.google.com/search/docs/data-types/event).  The main difference is that Artsdata enforces links between entities within Artsdata and interlinks URIs outside of Artsdata including links to Wikidata and other LOD sources.  Artsdata also generates unique global identifiers (IRIs also called URIs) for classes such as Event, Person, Place, and Organization.

Here are the main Classes used in Artsdata.

![Image](images/artsdata_event_model-3.png)

[[open drawing tool](https://www.yworks.com/yed-live/?file=https://gist.githubusercontent.com/saumier/c1d9b2a3392a1e03c8a14d9fbc2ac5d6/raw/8113c090a24e81c86c64d7a9425b865032a51517/artsdata_event_model)]

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

### Ontologies

Artsdata.ca uses a basic set of RDFS and OWL entailments (or ruleset) to enable simple inferencing, called **OWL-Horst (optimized)**. The main ontology used in Artsdata.ca is Schema.org. The current version of both OWL-Horst and Schema.org are located in this GitHub repository under "_triples". 

### Provenance

Data is great, but it is not the ultimate truth, and without traceability it can lose our trust.  To maintain trust it is important that we track provenance. For example, what if two web pages have different dates for the same performing arts event. Which source is more trust worthy? How can we follow the data back to the source to decide for ourselves? 

To track provenance Artsdata.ca uses metadata attached to named graphs. Each data source in Artsdata.ca is stored in a separate named graph. The graph's URI is used as the subject of the provenance metadata.  This technique to track provenance is generally called the **Named Graphs** approach, and is used instead of reification, N-ary relationships, singleton properties or context objects (see [video](https://www.youtube.com/watch?v=Vt8spQDNotc)).  Each named graph URI is linked to provenance metadata including dates when the data was loaded, the activity used to collect it and by whom. Each time data is imported,  whether from a web site, spreadsheet or existing triple store, the graphs provenance metadata is updated. In addition, when the data source is directly from a crawled web page, the schema:WebPage entity includes the date when the individual web pages were crawled. 

In the future we will likely switch to RDF\* (pronounced "RDF star") inorder to have more granular provenance data on individual statements.

### Support or Contact

[Contact support](mailto:support@culturecreates.com) and we’ll help you sort it out.
