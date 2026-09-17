---
title: Data Dumps
layout: architecture-doc
nav_order: 11
---

A data dump is a full serialized export of the Artsdata Core graph — useful when you want to load the entire dataset into your own triplestore or pipeline, instead of querying or dereferencing entities one at a time. Dumps are published periodically in Turtle format.

The current list of Artsdata Core dumps, with their version, description and download URL, is published at:

* [https://kg.artsdata.ca/en/data-dumps](https://kg.artsdata.ca/en/data-dumps) (French: [/fr/data-dumps](https://kg.artsdata.ca/fr/data-dumps))

## For automated / AI clients

The download URL for a given dump is versioned and changes whenever a new dump is published. Do not hardcode or cache a specific download URL — always resolve the current one from the page above, or from the Artsdata MCP Server, which exposes the same dump metadata programmatically.

## Alternatives to a static dump

If you need live or queryable access to the graph rather than a point-in-time export, see:

* [SPARQL Endpoint]({{ base }}/architecture/sparql.html)
* [Query API]({{ base }}/architecture/query-api.html)
