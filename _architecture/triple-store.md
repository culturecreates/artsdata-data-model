---
title: Artsdata Triplestore
layout: architecture-doc
---

The Artsdata triplestore is a standard (compliant with W3C Standards) RDF triplestore using "GraphDB Free" product by [OntoText](http://graphdb.ontotext.com).

GraphDB uses RDF4J as a library, taking advantage of its APIs for storage and querying, as well as the support for SPARQL 1.1 and RDF syntaxes (e.g., RDF/XML, N3, Turtle).

The [Docker Image](https://hub.docker.com/repository/docker/culturecreatesorg/graphdb) created by Culture Creates can be installed with `docker pull culturecreatesorg/graphdb:latest`

The triplestore is hosted on AWS with an NGINX server infront to manage SSL with a reverse-proxy. 

Notable configurations
======================

NGINX
------
* Maximum data post size 10M (client_max_body_size 10M)

GraphDB
------
* RAM Memory 4G `-Xms4g`
* CORS enabled `-Dgraphdb.workbench.cors.enable=true`
