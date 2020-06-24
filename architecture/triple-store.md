
{% include architecture-diagram.html %}

Artsdata Triplestore
--------------

The Artsdata triple store is a standard (compliant with W3C Standards) RDF triplestore using "GraphDB Free" product by [OntoText](http://graphdb.ontotext.com).

The [Docker Image](https://hub.docker.com/r/saumier/graphdb) created by Culture Creates is hosted on Google Cloud in a Kubernetes cluster. It has CORS, SSL and load balancing configured using NGINX and Ingress.

GraphDB uses RDF4J as a library, taking advantage of its APIs for storage and querying, as well as the support for SPARQL 1.1 and RDF syntaxes (e.g., RDF/XML, N3, Turtle).