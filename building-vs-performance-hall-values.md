<p>{% include back-button.html %}</p>

# Artsdata Guidelines Regarding Building vs. Performance Hall Values in location Entities

### Overview

When a building contains multiple performance halls, Artsdata can run into reconciliation issues if the structured data describes the building rather than the performance hall. It may look like two performances are happening at the same time and in the same place, whereas these are, in fact, two different places.

Here is the logic followed by Artsdata’s auto-minting process: 
* If two events are in the same Place; AND
* Their `startTime` is within a one hour difference; THEN
* Mark the two events as ado:PotentialDuplicate AND do not auto-mint.

### Recommendations

As per [Artsdata's instructions](https://docs.google.com/spreadsheets/d/1zGMVtrMO6Ja82jblir2AUjzSYAciCXBwoNzi-pomGok/edit?gid=0#gid=0), it is preferable to be as precise as possible when entering a `location` nested entity under an `@type Event`. In other words, it is better to enter the `name` and `sameAs` values for the performance hall where the event is taking place rather than for the building as a whole. 

However, an organization may prefer to enter the name of the building in their structured data – particularly if the building name is more well-known than the performance hall name, or if the performance hall shares its name with another hall in a different building. 

In these instances, there are two potential solutions:

#### 1. Enter different `name` and `sameAs` values

Enter the building name under location `name`, but add a `sameAs` pointing to a URI describing the performance hall. This way, the building name will be treated as the primary location label. However, machines will still be able to recognize that the physical location is the performance hall contained within the building rather than the building itself.
   Example:
   ```
"location":
         {
            "@type":"Place",
            "name":"Centre des arts Juliette-Lassonde",
            "address":{
               "@type":"PostalAddress",
               "addressLocality":"Saint-Hyacinthe",
               "addressRegion":"QC",
               "postalCode":"J2S 9E2",
               "streetAddress":"1705 Rue Saint-Antoine",
               "addressCountry":"CA"
            },
            "sameAs":[
               "http://kg.artsdata.ca/resource/K2-227",
               "http://www.wikidata.org/entity/Q111668872"]
    },
```
*Note that the Artsdata and Wikidata URIs under `sameAs` point to the Salle Desjardins performance hall inside Centre des arts Juliette-Lassonde.*

#### 2. Add a `containedinPlace` entity

Enter the performance hall name under location `name`. Add a `containedinPlace` nested entity with the building name under `name` and `sameAs`value pointing to a URI describing the building. This way, machines will be able to recognize that the performance hall is a part of the building rather than a separate location.
   Example:
```
 "location":
         {
            "@type":"Place",
            "name":"Salle Desjardins",
            "address":{
               "@type":"PostalAddress",
               "addressLocality":"Saint-Hyacinthe",
               "addressRegion":"QC",
               "postalCode":"J2S 9E2",
               "streetAddress":"1705 Rue Saint-Antoine",
               "addressCountry":"CA"
            },
            "containedinPlace":{
               "@type":"Place",
               "name":"Centre des arts Juliette-Lassonde",
               "sameAs":"http://kg.artsdata.ca/resource/K5-796"
            },
            "sameAs":[
               "http://kg.artsdata.ca/resource/K2-227",
               "http://www.wikidata.org/entity/Q111668872"]
    },
```
*Note that because the performance hall and building share the same address, it is not necessary to repeat the `address` nested entity within `containedinPlace`.*


### Good practices regarding location `sameAs`

See: [How to retrieve persistent identifiers' URIs](https://culturecreates.github.io/artsdata-data-model/identifier-recommendations.html#how-to-retrieve-persistent-identifiers-uris)
