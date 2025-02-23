---
class_name: Place
layout: class-doc
---

Types of Places 
====
The following types of places have been designed by the LDFI project led by CAPACOA. 

https://m.wikidata.org/wiki/Wikidata:WikiProject_Cultural_venues/Typology

Artsdata highly recommends using the Wikidata type URI as schema:additionalType. 

Artsdata also takes advantage of the schema:placeContainedIn to create links between rooms/halls and buildings. Also between buildings and encompassing places such as city. This automatically situated event venues in a city, region, province and country. Linking increases the ability for reconciling places when only a name and postal address is available. 

Proposed additions
=========

[maximumAttendeeCapacity](http://schema.org/maximumAttendeeCapacity)
-----------------
This is a recommended property. Systems like scenepro.ca and Wikidata can feed this information to Artsdata. When multiple plans are available, only the maximum value should be selected.

geo property
------------

https://schema.org/geo - The geo coordinates of the place.

This property is favoured over adding explicit longitude and latuitude because the property [geo](https://schema.org/geo) not only can include longitude and latitude in class [GeoCoordinates](http://schema.org/GeoCoordinates) but it can also be defined by the class [GeoShape](https://schema.org/GeoShape) which gives flexibility to define parks and areas that do not have a specific starting address.

This property can satisfy the SHACL validation for Places, removing the absolute requirement of a Place to have a PostalAddress.

Related discussion: [https://github.com/culturecreates/artsdata-data-model/discussions/126](https://github.com/culturecreates/artsdata-data-model/discussions/126)


