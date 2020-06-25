
{% include base.html %}
{% include architecture-diagram.html %}

Graph-store API
--------------

The Graph-store API is an API server (built with RAILS) that acts as a gateway between the ouside world and the Artsdata Triplestore.

It offers SPARQL and traditional RESTful POSTs. 

The main goal of the Graph-store API is to defend the Artsdata.ca data model.  All data sent to Artsdata.ca must meet certain constraints. Data that does not meet these contrains are rejected and errors are reported back to the client.

This work in progress is using [SHACL](https://www.w3.org/TR/shacl/) to describe the contraints in an effort to be as data centric as possible (use data triples to describe rules instead of hard coding).

Miniting URIs as a service, will probably be added to this API pending further needs analysis.