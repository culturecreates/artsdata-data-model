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

The following JSON-LD script is based on the member profile of [Leela Gilday]([url](https://ipaa.ca/profile/indigenous-artist/Leela%20Gilday)), a member of the Indigenous Performing Arts Alliance (IPAA). 

```
<script type="application/ld+json">
{
   "@context":"http://schema.org",
   "@type":"Person",
   "name":"Leela Gilday",
   "givenName":"Leela",
   "familyName":"Gilday",
   "alternateName":"Leela Gilday",
   "jobTitle":"Artist",
   "image":"https://ipaa.ca/wp-content/uploads/ninja-forms/2/PKP2349.jpg",
   "url":"https://www.leelagilday.com/",
   "workLocation":{
      "@type":"AdministrativeArea",
      "address":{
         "@type":"PostalAddress",
         "addressCountry":"CA",
         "addressRegion":"NT",
         "addressLocality":"Yellowknife"
      }
   },
   "knowsAbout":[
      {
         "@type":"Specialty",
         "name":"Artist",
         "sameAs":"http://www.wikidata.org/entity/Q483501"
      }
   ],
   "sameAs":[
      "http://www.wikidata.org/entity/Q6516255",
      "http://kg.artsdata.ca/resource/K12-447",
      "https://www.youtube.com/c/leelagildaymusic",
      "https://www.instagram.com/leelagildaymusic/?hl=en",
      "https://www.facebook.com/leelagildaymusic/"
   ],
   "memberOf":{
      "@type":"Organization",
      "name":"Indigenous Performing Arts Alliance",
      "url":"https://ipaa.ca/",
      "sameAs":"http://www.wikidata.org/entity/Q110938829"
   }
}
</script>
```

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

Schema does not have a property to describe an artist’s Indigenous ancestry. One method is to use additionalType and the URI of Wikidata item designating the Indigenous people that the artist belongs to.

Here’s an example:

```
"additionalType": 
"http://www.wikidata.org/entity/Q262457",
```
In this example, Q26457 corresponds to the Wikidata item for the Métis People.

### Contact us for more

Feel free to contact us at artsdata@capacoa.ca for more information. 
