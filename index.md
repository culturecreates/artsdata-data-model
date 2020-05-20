{% include base.html %}

## Artsdata Data Model v{{ site.data.versions.schemaVersion}}

A simple data model for Performing Arts Events and related Places, People and Organizations. 

You are welcome to give feedback and review current issues with [GitHub Issues](https://github.com/culturecreates/artsdata-data-model/issues). 

There is also a [PDF](https://drive.google.com/open?id=10-bnlDKv7w7LREakZ9b40BajbY39gbhJ) of the data that [Footlight](https://www.culturecreates.com/en/index.html#vision) feeds into Artsdata.  At the moment, the data that Footlight published on the websites of arts organizations and the data in Artsdata are very similar, but as more and more sources feed into Artsdata, the shape of the data between Footlight and Artsdata may diverge, with Footlight being a subset of classes and properties collected in Artsdata.

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

Artsdata.ca uses a basic set of RDFS and OWL entailments (or ruleset) to enable simple inferencing, called **OWL-Horst (optimized)**. The main vocabulary used in Artsdata.ca is Schema.org. The current version of both OWL-Horst and Schema.org are located in this GitHub repository under "_triples". 

### Provenance

Data is great, but it is not the ultimate truth, and without context it can quickly lose our trust.  To maintain trust   the provenance of the data is important. For example, data on a specific performing arts event has a specific date. But what if that date changes, and how can the data source be verified? 

To track provenance Artsdata.ca uses metadata attached to Named Graphs. Each data source is stored in a seperate graph with its metadata.  This approach to track provenance is generally called **Named Graph IDs**, and is used in place of reification or N-ary relationships.  Each graph has metadata about provenance including dates when the data was collected.  In addition, data collected from a web page is grouped under the schema:WebPage and includes the date when the the web page was cralwed. 

In the future we will likely switch to RDF*/SPARQL* inorder to have more granular provence data on individual statements.

### Support or Contact

[Contact support](mailto:support@culturecreates.com) and we’ll help you sort it out.
