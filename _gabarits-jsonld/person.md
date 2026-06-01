---
title: Person Structured Data Templates
layout: gabarits-doc
nav_order: 6
---

Structured Data Templates for Person
=====================================

Structured data templates in JSON-LD format based on the Schema.org vocabulary.

This is an evolving document for a Schema structured data template describing a [person](https://schema.org/Person) (i.e. an individual artist).

If you try out this JSON-LD template please contact Artsdata to let us know. We would love to see your structured data in action.

### Preview

```
{
   "@context": "http://schema.org/",
   "@type": "Person",
             "@id": "--URI constituant un identifiant unique de la personne. Optionnel : URI constituting a unique identifier of the person. Optional--",
             "name": "--Nom de la personne : Name of the person--",
             "givenName": "--Prénom de la personne : Given name of the person--",
             "familyName": "--Nom de famille de la personne : Family name of the person--",
             "jobTitle": "--Discipline artistique ou titre, par exemple Compositeur : Artistic discipline or title, for example Composer. Optional--",
             "alternateName": "--Pseudonyme ou nom alternatif. Optionnel : Pseudonym or alternate name. Optional--",
             "image": "--URL de l'image (JPEG ou PNG) : URL of the image (JPEG or PNG)--",
             "url": "--URL officiel du site Web de la personne : Official URL of the person's website--",
   ...
```

### Full template

See the [full JSON-LD template in GitHub](https://github.com/culturecreates/artsdata-data-model/blob/master/_gabarits-jsonld/Person/Person.jsonld)

### Example For An Artist Profile

The following JSON-LD script is based on the member profile of [Aqua Nibii Waawaaskone]([url](https://ipaa.ca/profile/indigenous-artist/a_waawaaskone)), a member of the Indigenous Performing Arts Alliance (IPAA). Since this particular member profile did not exemplify all properties in the IPAA individual member schema, we filled in the blanks with fake values in all caps. 

```
<script type="application/ld+json">
{
"@context": "http://schema.org/",
   "@type": "Person",
     "name": "Aqua Nibii Waawaaskone",
     "givenName": "Aqua Nibii",
     "familyName": "Waawaaskone",
     "alternateName": "SOMEPSEUDONYM",
     "image": "https://ipaa.ca/wp-content/uploads/avatars/17/AQUA FABCOLLAB.JPG",
     "@id": "SOME_URI",
     "url": "https://aquamusic.ca/",
     "mainEntityOfPage": "https://ipaa.ca/profile/indigenous-artist/a_waawaaskone",
     "workLocation": 
     {
        "@type": "AdministrativeArea",
        "address": {
        "@type": "PostalAddress",
        "addressCountry": "CA",
        "addressRegion": "ON",
        "addressLocality": "Mississaugas of Scugog/Tkaronto"
				}
        },
        "knowsAbout": [
        {
        "@type":	"Specialty",
        "Name":	"Music",
        "sameAs":	"http://www.wikidata.org/entity/Q638"
        },
        {
        "@type": 	"Specialty",
        "Name":	"Other",
        "sameAs":	"http://www.wikidata.org/entity/Q184485"
        }
],
         "sameAs": [
         "ISNI_URI",
         "WIKIDATA_URI",
         "ARTSDATA_URI",
         "https://www.facebook.com/aquamusic.ca/", 
         "https://itunes.apple.com/ca/artist/aqua-nibii-waawaaskone/1077333329", 
         "https://www.instagram.com/redrhythmandblues/", 
         "https://www.facebook.com/redrhythmandblues/", 
         "https://www.facebook.com/aqua.nibiiwaawaaskone ",
         "https://www.youtube.com/channel/UCP8DA12ia48T3O8X--G_yJ"
			],
         "memberOf":	{
         "@type":	"Organization",					
         "name":	"Indigenous Performing Arts Alliance",
         "url":	"https://ipaa.ca/",					
         "sameAs":	"http://www.wikidata.org/entity/Q110938829"
				}
}
</script>
```

### Tips about the JSON-LD syntax

* The order of properties doesn’t matter. Just be mindful that every property-value pair must have a comma at the end of the line, except for the last property-value pair of an object. In other words, you want commas everywhere, except before a closing square bracket (]) or a closing curly brace (}).
* You may test your JSON-LD script with the Schema validator

### Other recommended properties for artist profiles

#### birthPlace and workLocation

Provenance metadata is particularly important for artists. If you want to make an artist’s provenance more easily readable and processable by machines, the [birthPlace]([url](https://schema.org/birthPlace)) and [workLocation]([url](https://schema.org/workLocation)) properties are recommended, along with sameAs entity links to geographic databases.

```
"birthPlace": {
      "@type": "AdministrativeArea",
      "address": {
          "@type": "PostalAddress",
          "addressCountry": "COUNTRY",
          "addressRegion": "PROVINCE",
          "addressLocality": "CITY" 
          },
      "sameAs": [
          "WIKIDATA CONCEPT URI for the city",
          "GEONAMES RDF URI for the city" (http://sws.geonames.org/$1/)"
          ]
}
```
The city is optional. Same for the region. You could choose to only disclose the country of birth. If you disclose the city, we recommend you include a "sameAs" pointing to the Wikidata item for the city.

For the addressCountry and addressRegion, we recommend using two-letter codes. For example, "CA" for “Canada”.

You can model birthPlace and workLocation either as a Place, AdministrativeArea (as above) or as a ContactPoint.

#### Indigenous identity

Schema does not have a property to describe an artist’s Indigenous ancestry. In the absence of a proper method, the convention in Canada is to use additionalType and the URI of Wikidata item designating the Indigenous people that the artist belongs to.

Here’s an example:

```
"additionalType": 
"http://www.wikidata.org/entity/Q262457",
```
In this example, Q26457 corresponds to the Wikidata item for the Métis People.

### Contact us for more

Feel free to contact us at artsdata@capacoa.ca for more information. 
