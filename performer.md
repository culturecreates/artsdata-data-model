{% include back-button.html %}

{% include language-switcher.html %}

# Artsdata Guidelines Regarding the performer Property

The `performer` property provides extremely valuable information about a performing arts event. For example, it can be used to retrieve other performances by the same performer entity or to filter events based on the origin of the performer.

### Good practices for selecting `performer` values

Selecting the right value(s) for the `performer` property can be a little challenging at times. That's why we drafted these [Good Practices for Selecting performer Values]({{ base }}/performer-values.html).

### Good practices regarding performers' `@type`

Determining whether a performer should be assigned the [`Person`](https://schema.org/Person), [`PerformingGroup`](https://schema.org/PerformingGroup), or [`Organization`](https://schema.org/PerformingGroup) is not a always a straightforward task. 

Confusion often arises when a solo artist is performing along with other musicians whose names are not specified. 

Let's take an example: Susan Aglukark [ad:K12-296](http://kg.artsdata.ca/resource/K12-296) is touring along with four musicians, but we don't know who they are, and they may even change from one performance to another. In such a case, is the performer entity a `Person` or a `PerformingGroup`?

**If the name of the performer entity is the name of a physical person, then the type should be `Person`.** 

Here's why.

`PerformingGroup` is a subclass of `Organization` and has no direct or indirect relationship with the `Person` class in the Schema.org ontology. Consequently, if the type were `PerformingGroup`, search engines, Artsdata and other user agents reading the data will attempt to reconcile the name string - "Susan Aglukark" in the above example - against other `PerformingGroup` or `Organization` entities in authority files. Since Susan Aglukark is considered a Person in Wikidata, Musicbrainz, VIAF and ISNI (and Artsdata), they may not find a match.

In other words, if you want your structured data to make sense for machines, you should use the same type as one would find in authority files such as [Wikidata](https://www.wikidata.org/) and [VIAF](https://viaf.org/).

In situations where it is not possible to assign a specific type to a given `performer` entity or if you wish to define a default type that will be true for all `performer` objects, Artsdata recommends the following modelling for the nested entity:

```
    {
        "@type": "Thing",
        "additionalType": [
            "http://dbpedia.org/ontology/Agent",
            "http://xmlns.com/foaf/0.1/Agent",
            "http://www.cidoc-crm.org/cidoc-crm/E39_Actor"],
        "name": "--Nom de l'entité : Name of the entity--",
        "sameAs": ""--URI Artsdata.ca, obtenue avec l'API de réconciliation ou l'outil de recherche : Artsdata.ca URI, obtained with the Reconciliation API or the search tool--"
        }
```

In this proposed modelling, the "Agent" and "Actor" additional types are classes designating "an entity that acts", and are super classes to persons, groups and organizations. The Artsdata reconciliation server enables reconciliation against the [`dbo:Agent`](https://dbpedia.org/ontology/Agent) class.

Even though `Thing` is not an expected type for objects nested under the `performer` property in Schema.org, the Schema community deems it acceptable to use a broader type (or to omit the type altogether), when a narrower type cannot be defined ([read more](https://github.com/culturecreates/artsdata-data-model/discussions/127#discussioncomment-12947634)).

In conjunction with the use of `Thing` as a default broader type, we recommend providing a `sameAs` to an Artsdata ID. If the `performer` object has `Thing` as the default broader type, and it also has a `sameAs` to an Artsdata ID (where a narrower type is always stated), then search engines can compare the two data records and choose to use the narrower type for the performer entity.

### Good practices regarding performers' `sameAs`

- [Artsdata guidelines about the schema:sameAs property]({{ base }}/identifiers-guidelines/sameas.html)
  - [How to retrieve persistent identifiers' URIs]({{ base }}/identifiers-guidelines/retrieve-uri.html)
