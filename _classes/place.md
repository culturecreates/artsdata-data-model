---
class_name: Place
layout: class-doc
---

Proposed additions
=========

geo property
------------

https://schema.org/geo - The geo coordinates of the place.

This property is favoured over adding explicit longitude and latuitude because the property [geo](https://schema.org/geo) not only can include longitude and latitude in class [GeoCoordinates](http://schema.org/GeoCoordinates) but it can also be defined by the class [GeoShape](https://schema.org/GeoShape) which gives flexibility to define parks and areas that do not have a specific starting address.

This property can satisfy the SHACL validation for Places, removing the absolute requirement of a Place to have a PostalAddress.

