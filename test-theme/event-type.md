<p>{% include back-button.html %}</p>
{% include language-switcher.html %}

## Artsdata Event Types

The list of types (SKOS concepts) and the concept scheme can be viewed here [ArtsdataEventTypes](http://kg.artsdata.ca/resource/ArtsdataEventTypes).

For example, an Event can be assigned the type [http://kg.artsdata.ca/resource/PerformingArtsEvent](http://kg.artsdata.ca/resource/PerformingArtsEvent) showing narrower and broader SKOS concepts.

To suggest edits visit [Google Sheet](https://docs.google.com/spreadsheets/d/1ud_kVTE8C97ZMoe1uYGQ6rW_dodKqsbqiCutLLHO9jo/edit?usp=sharing) to view the version of the Artsdata controlled vocabulary and mapping to other vocabularies. 

Your input is welcome. Please click the link in the top nav bar to open an issue.

### How to use

The Artsdata Event Type controlled vocabulary is used along with the schema.org Event type.  An Event in Artsdata is a http://schema.org/Event (schema:Event or schema:EventSeries) and optionally an additional type from the Artsdata Event Controlled Vocabulary using the schema:additionalType property.

For example: 
```
ex:Event1 a schema:Event ; 
schema:additionalType <http://kg.artsdata.ca/resource/PerformingArtsEvent> .
```

To implement schema:Event and schema:additionalType properties in your structured data, please consult Artsdata's [structured data templates](https://culturecreates.github.io/artsdata-data-model/gabarits-jsonld/README.html).

### Reconciling

You can reconcile event types using the Artsdata Reconciliation Service. 
<img width="1280" alt="Screen Shot 2022-08-14 at 9 53 10 PM" src="https://user-images.githubusercontent.com/419491/184564852-ed5baeb8-952d-43c7-b8a1-b06b6ba65152.png">

To give it a try:
1. Go to the [W3C entity reconciliation test bench](https://reconciliation-api.github.io/testbench/#/client/https%3A%2F%2Fapi.artsdata.ca%2Frecon)
2. Enter the name of an event type, such as Circus
3. Click the Reconcile button

To limit the results only to the controlled vocabulary:
1. Select the "type" radio button "Artsdata Event Type"
8. Click the Reconcile button

### Dereferencing

Each SKOS Concept or ConceptScheme URI can be dereferenced individually. Or you can download the entire vocabulary using this [download link](https://db.artsdata.ca/repositories/artsdata/statements?context=%3Chttp://kg.artsdata.ca/culture-creates/artsdata-data-model/skos-event-types%3E).
