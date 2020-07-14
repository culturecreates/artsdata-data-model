---
class_name: Person
layout: class-doc
shex: person
---

## Adding people

To add a performing arts person please create the person in Wikidata and fill in the following fields.
* Given name
* Family name
* Occupation
  * actor
  * stage director
  * musician
* Instance of human
* Gender
  * male
  * female
  * intersex
  * transgender female
  * transgender male
  * non-binary


Artsdata uses [ShEx](https://shex.io) to validate data for import. If the data passes the ShEx validation, the person will automatically be added to Artsdata.ca in a couple of days.

###  ShEx Validator 

Test using this [Online Validator](https://shex-simple.toolforge.org/wikidata/packages/shex-webapp/doc/shex-simple.html?data=Endpoint:%20https://query.wikidata.org/sparql&hideData&manifest=[]&textMapIsSparqlQuery&schemaURL=https://raw.githubusercontent.com/culturecreates/artsdata-data-model/master/shex/wikidata_person.shex)

