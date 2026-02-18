---
title: SPARQL Endpoint
layout: architecture-doc
---

A SPARQL endpoint is a web service that allows users to query a dataset using the SPARQL query language, which is designed for querying RDF (Resource Description Framework) data.

The SPARQL service with a User Interface: [https://query.artsdata.ca/sparql](https://query.artsdata.ca/sparql). 

The SPARQL endpoint for using in code: [https://query.artsdata.ca/query](https://query.artsdata.ca/query).

For example SPARQL query see this [query of Places with an Artsdata ID](curl https://query.artsdata.ca/query -X POST --data 'query=%23+Places+in+Artsdata.ca+core+dataset%0A%0APREFIX+schema%3A+%3Chttp%3A%2F%2Fschema.org%2F%3E%0A%0ASELECT++*+%0AFROM+%3Chttp%3A%2F%2Fkg.artsdata.ca%2FPlace%3E%0AFROM+%3Chttp%3A%2F%2Flaval.footlight.io%2FPlace%3E%0AWHERE+%7B%0A++%0A++%3FArtsdataID+a+schema%3APlace++.%0A++%0A++%3FArtsdataID+schema%3Aname+%3Flabel+.%0A++filter+(lang(%3Flabel)+%3D+%22%22)+%0A++%0A++OPTIONAL+%7B+%3FArtsdataID+schema%3AcontainedInPlace%2Fschema%3Aname+%3FcontainedIn++filter+(lang(%3FcontainedIn)+%3D+%22%22)+%7D%0A++OPTIONAL+%7B+%3FArtsdataID+schema%3AsameAs+%3FWikidataID+.+filter+(regex(str(%3FWikidataID)%2C+%22wikidata.org%2Fentity%22))+%7D%0A++OPTIONAL+%7B+%3FArtsdataID+schema%3Aaddress%2Fschema%3AstreetAddress+%3Faddress+.+%7D%0A++OPTIONAL+%7B+%3FArtsdataID+schema%3Aaddress%2Fschema%3AaddressLocality+%3Flocality+.+%7D%0A++OPTIONAL+%7B+%3FArtsdataID+schema%3Aaddress%2Fschema%3AaddressCountry+%3Fcountry+.+%7D%0A%0A++filter+(isURI(%3FArtsdataID))%0A%7D+%0AORDER+BY+ASC(%3FArtsdataID)%0A%0ALIMIT+500' -H 'Accept: application/sparql-results+json'). 


## Wikidata Interlinking

Artsdata.ca has created property [P7627](https://www.wikidata.org/wiki/Property:P7627) in Wikidata for linking entities from Wikidata to Artsdata.ca
