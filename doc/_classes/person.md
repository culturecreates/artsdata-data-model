---
class_name: Person
layout: class-doc
shex: person
---

## Adding people

To add a performing arts person please create the person in Wikidata and fill in the following fields.
* Given name
* Family name
* Occupation (one or more occupations but atleast one of "actor" or "stage director" or "musician"
* Instance of human
* Gender (male, female, intersex, transgender female, transgender male, non-binary)


If the artist data passes this [ShEx](https://shex.io) validator, it will be automatically be added to Artsdata.ca in a couple of days.
[Online Validator](https://shex-simple.toolforge.org/wikidata/packages/shex-webapp/doc/shex-simple.html?data=Endpoint:%20https://query.wikidata.org/sparql&hideData&manifest=[]&textMapIsSparqlQuery&schemaURL=https://raw.githubusercontent.com/culturecreates/artsdata-data-model/master/shex/wikidata_person.shex)


###  ShEx Validator 
TODO: Load shex file dynamically from shex folder
```ShEx
PREFIX p: <http://www.wikidata.org/prop/>
PREFIX wd: <http://www.wikidata.org/entity/>
PREFIX wdt: <http://www.wikidata.org/prop/direct/>

start = @<artist>

<artist> {
	wdt:P31 [wd:Q5] ; # human
        wdt:P21 [wd:Q6581097 wd:Q6581072 wd:Q1097630 wd:Q1052281 wd:Q2449503 wd:Q48270]? ;    # has a gender
        wdt:P735 . * ;  # given name
        wdt:P734 . * ;  # family name
        wdt:P106 . *  ; # has occupation
  wdt:P106 [ wd:Q33999  wd:Q3387717 wd:Q639669]  # actors, stage directors and musicians
}
```
