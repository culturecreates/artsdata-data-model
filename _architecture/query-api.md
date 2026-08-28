---
title: Query API
layout: architecture-doc
nav_order: 13
---
There are several APIs to query Artsdata.

List of APIs to query Artsdata:
- [Artsdata MCP Server](#artsdata-mcp-server)
- [Query API wrapper for SPARQ](#query-api-wrapper-for-sparql)
- [Event Search API (deprecated)]

# Artsdata MCP Server
Artsdata is live in the official [MCP Registry](https://registry.modelcontextprotocol.io/v0.1/servers?search=ca.artsdata/mcp). 

The Artsdata MCP Server exposes the [Artsdata](https://artsdata.ca) knowledge
graph to AI agents and LLM-based tools via the
[Model Context Protocol](https://modelcontextprotocol.io) (MCP). It lets an
agent search for entities (organizations, people, places), fetch full entity
details, and search for events — all backed by Artsdata's linked-data
knowledge graph.

## Endpoint

```text
https://mcp.artsdata.ca/mcp
```

The server implements the MCP **Streamable HTTP** transport. Requests are
JSON-RPC 2.0 messages sent via `POST`, and require an initialization
handshake before any tool can be called.

For more details visit [Artsdata mcp-server doc](https://github.com/culturecreates/artsdata-mcp-server/blob/main/docs/mcp-server.md) 

## See also

- [Model Context Protocol specification](https://modelcontextprotocol.io)
- [Artsdata](https://artsdata.ca)

# Query API wrapper for SPARQL
A RESTful API to query anything in Artsdata including events, people, places, organizations and vocabularies...

This API is in active development and may change. If you are looking for a stable API then please use the [Artsdata Reconciliation Service](https://docs.artsdata.ca/architecture/reconciliation) which can be used to search (/match) entities in Artsdata, retrieve data (/extend) about those entities using Artsdata identifiers, as well as generate an HTML preview (/preview) of an Artsdata entity.

The Artsdata Query API is a SPARQL wrapper. It uses the SPARQL passed in as a parameter in the HTTP GET /query request.

| Parameter | Description |
| -- | -- |
| sparql | SPARQL to run (optional). May be a reserved name or a remote URL. Defaults to `query_adid`. |
| frame | JSON-LD frame (optional). May be a reserved name or a remote URL. | 
| format  | Data format in the response body (optional). json \| jsonld \|html. Defaults to `html` |
| adid | K-number used in the SPARQL template (optional).| 
| -- | -- |

### Examples

#### Any Artsdata ID: K2-197
https://api.artsdata.ca/query?adid=K2-197&format=json&sparql=query_adid

#### Place: Cabaret La Basoche
http://api.artsdata.ca/query?adid=K5-7&format=json&frame=ranked_place_footlight&sparql=ranked_place_footlight

#### Person: Étienne Coppée
http://api.artsdata.ca/query?adid=K5-21&format=json&frame=ranked_org_person_footlight&sparql=ranked_org_person_footlight

#### Organization: Société de musique de chambre de Gatineau
https://api.artsdata.ca/query?adid=K5-3&format=json&frame=ranked_org_person_footlight&sparql=ranked_org_person_footlight



# Event Search API (deprecated)

The Event Search API has been replaced by the [Reconciliation Service](https://docs.artsdata.ca/architecture/reconciliation). To search for events on a date and location, use the reconciliation match service with schema:startDate and schema:location properties.

A MCP Server is also being developed.

The following documentation is preserved for historical reasons:

> The Event Search API is a dedicated endpoint for events and provides an easy way to get a list of events in json or json-ld. The "frame" parameter enables the user to select different output properties and structures. The "format" parameter selects between json and json-ld. And the "source" parameter selects the graph or calatog of graphs. Documentation WIP.
>
>Example: List of upcoming events from the placedesarts.com website in Montreal: 
http://api.artsdata.ca/events?format=json&frame=event_bn&source=http://kg.artsdata.ca/culture-creates/footlight/placedesarts-com
>
>### Source parameter
>Many different datasets are uploaded to Artsdata daily. The Event API allows you to specific the source of your dataset by passing a dataset URI or a catalog of datasets URI.
>
>Here is a list of [graphs](https://kg.artsdata.ca/query/show?sparql=feeds_all&title=Data+Feeds) that can be used as the source parameter.
>
>It is possible to create your own catalog of datasets as well.
>
>### Events demo
>
>Here is a [demo website in Github](https://github.com/culturecreates/artsdata-demo-upcoming-events-api) that lists upcoming events in Quebec using the Artsdata API.






