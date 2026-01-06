{% include back-button.html %}

{% include genres-languages.html %}

## Artsdata Controlled Vocabulary for Genres

| <!-- --> | <!-- --> |
| - | - |
| Concept scheme | [adr:ArtsdataGenres](http://kg.artsdata.ca/resource/ArtsdataGenres) |
| Version | 1.0 |
| Release date | January 2025 |

This page describes the controlled vocabulary used in the Artsdata knowledge graph to differentiate genres in the arts and culture sector, and more specifically in the performing arts.

This controlled vocabulary represents a list of values for the property [schema:genre](https://schema.org/genre), whose domain is [schema:CreativeWork](https://schema.org/CreativeWork). It is therefore a controlled vocabulary that can be used to describe both works that are part of the OEMI continuum (for example, a play as a dramatic text), as well as live performance works ([ado:LivePerformanceWork](http://kg.artsdata.ca/ontology/LivePerformanceWork)) that incorporate expressions of OEMI works (for example, a theatrical production). This can lead to confusion in cases where a live performance work associated with one genre incorporates or is derived from a work associated with another genre (for example, a circus show based on Romeo and Juliet). In such cases, the appropriate genre declaration should be associated with each work entity.

This vocabulary has multiple levels of hierarchy (the initial vocabulary contains two levels, but it would be possible to add additional levels). The relationships skos:narrower/skos:broader between concepts have a “many-to-many” cardinality: a concept may have none, one, or multiple parents.

The concept identifiers are opaque. This ensures the stability of URIs while allowing the flexibility to change labels as often as needed.

The Artsdata controlled vocabulary for genres is more of a “service vocabulary” than a “reference vocabulary.” It does not aim to standardize genre concepts, but rather to support interoperability among the many existing genre vocabularies. Artsdata uses it in conjunction with its reconciliation service in order to programmatically recognize genre strings and match them with genre concepts from Artsdata as well as external concepts. The Artsdata controlled vocabulary is mapped to the following vocabularies:

* Wikidata
* Art and Architecture Thesaurus (partial)
* Musicbrainz (via Wikidata)

The inaugural version of this controlled vocabulary was proposed in November 2025. The discussions surrounding its creation are documented in [this discussion](https://github.com/culturecreates/artsdata-data-model/discussions/186).

### Concepts

The list of genres (SKOS concepts) can be consulted in the [concept scheme](http://kg.artsdata.ca/resource/ArtsdataGenres), in this [spreadsheet](https://docs.google.com/spreadsheets/d/1RSbTTJtjBW48BKVwQR9zcR4zr2wDEtoq-wvuAqYwiY0/edit?usp=sharing), or in the table below.

| CURI | Preferred label | Exact match | Close match |
| - | - | - | - |
| [K6-100](http://kg.artsdata.ca/resource/K6-100) | Theatre | wd:Q11635, aat:300417582 | |
| [K6-200](http://kg.artsdata.ca/resource/K6-200) | Dance | wd:Q11639, aat:300054144 | |
| [K6-201](http://kg.artsdata.ca/resource/K6-201) | Ballet | wd:Q41425 |wd:Q1020618 |
| [K6-202](http://kg.artsdata.ca/resource/K6-202) | Contemporary dance | wd:Q186035 | |
| [K6-203](http://kg.artsdata.ca/resource/K6-203) | Modern dance | wd:Q850130 | |
| [K6-204](http://kg.artsdata.ca/resource/K6-204) | Cultural dance | wd:Q201022 | |
| [K6-300](http://kg.artsdata.ca/resource/K6-300) | Music | wd:Q638, aat:300054146 | |
| [K6-301](http://kg.artsdata.ca/resource/K6-301) | Classical | wd:Q9730 | |
| [K6-302](http://kg.artsdata.ca/resource/K6-302) | Country | wd:Q83440 | |
| [K6-303](http://kg.artsdata.ca/resource/K6-303) | Folk |  |wd:Q43343 |
| [K6-304](http://kg.artsdata.ca/resource/K6-304) | Jazz | wd:Q8341 | |
| [K6-305](http://kg.artsdata.ca/resource/K6-305) | Blues | wd:Q9759 | |
| [K6-306](http://kg.artsdata.ca/resource/K6-306) | New Music |  |wd:Q8011523 |
| [K6-307](http://kg.artsdata.ca/resource/K6-307) | Popular music | wd:Q373342 | |
| [K6-308](http://kg.artsdata.ca/resource/K6-308) | World music | wd:Q205049 | |
| [K6-309](http://kg.artsdata.ca/resource/K6-309) | Chanson | wd:Q1062400 | |
| [K6-310](http://kg.artsdata.ca/resource/K6-310) | Instrumental | wd:Q639197 | |
| [K6-311](http://kg.artsdata.ca/resource/K6-311) | Alternative | wd:Q1695023 | |
| [K6-312](http://kg.artsdata.ca/resource/K6-312) | Electronic | wd:Q9778 | |
| [K6-313](http://kg.artsdata.ca/resource/K6-313) | Metal | wd:Q12326776 | |
| [K6-314](http://kg.artsdata.ca/resource/K6-314) | Rap | wd:Q11401 | |
| [K6-315](http://kg.artsdata.ca/resource/K6-315) | Rhythm and blues | wd:Q45981 | |
| [K6-316](http://kg.artsdata.ca/resource/K6-316) | Rock | wd:Q11399 | |
| [K6-400](http://kg.artsdata.ca/resource/K6-400) | Musico-dramatic |  |wd:Q123777276 |
| [K6-401](http://kg.artsdata.ca/resource/K6-401) | Musical Theatre |  |wd:Q1370345 |
| [K6-402](http://kg.artsdata.ca/resource/K6-402) | Opera | wd:Q1344 | |
| [K6-500](http://kg.artsdata.ca/resource/K6-500) | Spoken |  | |
| [K6-501](http://kg.artsdata.ca/resource/K6-501) | Storytelling |  |wd:Q989963 |
| [K6-502](http://kg.artsdata.ca/resource/K6-502) | Poetry |  |wd:Q482 |
| [K6-503](http://kg.artsdata.ca/resource/K6-503) | Slam |  |wd:Q2293670 |
| [K6-504](http://kg.artsdata.ca/resource/K6-504) | Spoken Word | wd:Q1428637 | |
| [K6-900](http://kg.artsdata.ca/resource/K6-900) | Performing art |  |wd:Q184485 |
| [K6-901](http://kg.artsdata.ca/resource/K6-901) | Circus |  |wd:Q713197 |
| [K6-902](http://kg.artsdata.ca/resource/K6-902) | Comedy |  |wd:Q3492850 |
| [K6-903](http://kg.artsdata.ca/resource/K6-903) | Variety | wd:Q117187901 | |
| [K6-904](http://kg.artsdata.ca/resource/K6-904) | Puppetry | wd:Q588750, aat:300248147 | |
| [K6-905](http://kg.artsdata.ca/resource/K6-905) | Mime | wd:Q39818, aat:300417615 | |
| [K6-906](http://kg.artsdata.ca/resource/K6-906) | Magic | wd:Q148442, aat:300417618 | |
