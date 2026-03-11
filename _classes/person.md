---
class_name: Person
layout: class-doc
shex: person
nav_order: 9
title: Person
---

## Adding people

Here is a [preliminary document](https://docs.google.com/document/d/1GsMstjpbTYBqVtbR8bM5fHmJpz4yL7PIQxrixcxlSPo/edit) (French only) on a template to add People.

Another way is to add a performing arts person in Wikidata and fill in the following required fields. Please add as much data as possible to help cases that require disambiguation.  We recommend linking social media profiles, and external global IDs like ISNI, but these are not mandatory. 

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
* Date of birth

### Structured data templates

This [evolving document](https://docs.google.com/document/d/1izeqwhezGme0kE_Q0wLN16C6wVrWQtRym6-7zqvaTeA/edit?usp=sharing) contains our latest structured data templates for artists. Aside from the standard JSON-LD format, there are also three different templates in Microdata format.

Le document est disponible également [en français](https://docs.google.com/document/d/1GsMstjpbTYBqVtbR8bM5fHmJpz4yL7PIQxrixcxlSPo/edit?usp=sharing).


###  ShEx Validator 

Artsdata uses [ShEx](https://shex.io) to validate data for import. If the data passes the ShEx validation, the person will automatically be added to Artsdata.ca in a couple of days.

Test using this [Online Validator](https://shex-simple.toolforge.org/wikidata/packages/shex-webapp/doc/shex-simple.html?data=Endpoint:%20https://query.wikidata.org/sparql&hideData&manifest=[]&textMapIsSparqlQuery&schemaURL=https://raw.githubusercontent.com/culturecreates/artsdata-data-model/master/shex/wikidata_person.shex)


