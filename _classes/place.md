---
class_name: Place
layout: class-doc
nav_order: 10
title: Place
---

# Place

Artsdata imports the `Place` class from Schema.org. In Schema.org, a [Place](https://schema.org/Place) is defined as "Entities that have a somewhat fixed, physical extension."

## Types of Places 

The following types of places have been designed by the LDFI project led by CAPACOA. 

https://m.wikidata.org/wiki/Wikidata:WikiProject_Cultural_venues/Typology

Artsdata highly recommends using the Wikidata type URI as schema:additionalType. 

Artsdata also takes advantage of the schema:placeContainedIn to create links between rooms/halls and buildings. Also between buildings and encompassing places such as city. This automatically situated event venues in a city, region, province and country. Linking increases the ability for reconciling places when only a name and postal address is available. 

## Minimal requirements for Place entities

To be minted (i.e. assigned) a new Artsdata unique persistent identifier or to be automatically linked to an existing Artsdata ID, a `Place` type entity must comply with any of these three shapes.

**1. complete schema:PostalAddress object (including streetAddress, locality (city), region (province/territory), postalCode, country)**

```
 "address": {
    "type": "PostalAddress",
    "streetAddress":  "580 Rue Maclaren E",
    "addressLocality": "Gatineau",
    "addressRegion": "QC",
    "postalCode": "J8L 2W1",
    "addressCountry":"CA"
  }
```

OR

**2. schema:longitude + schema:latitude AND schema:PostalAddress object with region (province) and country**

```
  "latitude": "45.5873706",
  "longitude": "-75.400796",
  "address": {
    "type": "PostalAddress",
    "addressRegion": "QC",
    "addressCountry":"CA"
    }
```
```
 "geo": {
    "@type": "GeoCoordinates",
    "latitude": "40.75",
    "longitude": "-73.98"
  },
  "address": {
    "type": "PostalAddress",
    "addressRegion": "QC",
    "addressCountry":"CA"
  }
```

OR

**3. schema:geo with a GeoShape object and schema:PostalAddress object with province and country**

```
  "geo": {
    "@type": "GeoShape",
    ...one of the following properties: "box", "circle", "polygon"
  },
  "address": {
    "type": "PostalAddress",
    "addressRegion": "QC",
    "addressCountry":"CA"
  }
```

Related discussion: [Mint/Link Parks and Other Places Without Postal Codes #343](https://github.com/culturecreates/artsdata-data-model/discussions/343)

## Properties in the Artsdata Ontology

## Notes about selected Schema.org propertries

[maximumAttendeeCapacity](http://schema.org/maximumAttendeeCapacity)
-----------------
This is a recommended property. Systems like scenepro.ca and Wikidata can feed this information to Artsdata. When multiple plans are available, only the maximum value should be selected.

geo property
------------

https://schema.org/geo - The geo coordinates of the place.

This property is favoured over adding explicit longitude and latuitude because the property [geo](https://schema.org/geo) not only can include longitude and latitude in class [GeoCoordinates](http://schema.org/GeoCoordinates) but it can also be defined by the class [GeoShape](https://schema.org/GeoShape) which gives flexibility to define parks and areas that do not have a specific starting address.

This property can satisfy the SHACL validation for Places, removing the absolute requirement of a Place to have a PostalAddress.
