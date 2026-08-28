---
title: Query API
layout: architecture-doc
nav_order: 13
---

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

| | |
|---|---|
| Transport | Streamable HTTP (JSON-RPC 2.0 over `POST`) |
| Protocol version | `2024-11-05` |
| Auth | None (public) |

## Connecting a client

Most MCP-aware tools (Claude Code, Claude Desktop, etc.) can connect directly
by pointing an MCP client configuration at the endpoint above — no manual
handshake required. 

## Tools

### `search_entities`

Search for entities in the Artsdata knowledge graph by name and, optionally,
type.

**Input**

| Parameter | Type | Required | Description |
|---|---|---|---|
| `query` | string | Yes | Non-empty search query. |
| `types` | array of `Place \| Person \| Organization` | No | Filter results by entity type. |
| `language` | `en` \| `fr` | No (default `en`) | Language for matching/labels. |
| `limit` | integer (1–50) | No (default 25) | Max number of results. |

**Output**

```json
{
  "results": [
    {
      "id": "string",
      "name": "string",
      "description": "string",
      "type": [ { "id": "uri", "name": "string" } ],
      "uri": "uri"
    }
  ]
}
```

**Example call**

```json
{
  "name": "search_entities",
  "arguments": {
    "query": "Cirque du Soleil",
    "types": ["Organization"],
    "limit": 5
  }
}
```

### `get_entity`

Retrieve full details for a single entity, given its Artsdata URI.

**Input**

| Parameter | Type | Required | Description |
|---|---|---|---|
| `uri` | string (URI) | Yes | The Artsdata entity URI. |

**Output**

```json
{
  "id": "string",
  "uri": "uri",
  "types": [ { "uri": "uri", "label": "string" } ],
  "name": [ { "value": "string", "language": "en|fr" } ],
  "alternate_names": [ { "value": "string", "language": "en|fr" } ],
  "description": [ { "value": "string", "language": "en|fr" } ],
  "main_entity_of_page": "uri",
  "same_as": ["string"],
  "additional_properties": [
    {
      "predicate": { "uri": "uri", "label": "string" },
      "values": ["string"]
    }
  ]
}
```

**Example call**

```json
{
  "name": "get_entity",
  "arguments": {
    "uri": "https://kg.artsdata.ca/resource/K11-70"
  }
}
```

**Example response**

```json
{
  "id": "K11-70",
  "uri": "http://kg.artsdata.ca/resource/K11-70",
  "name": [
    { "value": "Klondike Institute of Art & Culture", "language": "en" },
    { "value": "Klondike Institute of Art & Culture" },
    { "value": "Klondike Institute of Art & Culture", "language": "fr" }
  ]
}
```

### `search_events`

Search for events in the Artsdata knowledge graph by place, artist,
organization, type, and language.

**Input**

| Parameter | Type | Required | Description |
|---|---|---|---|
| `places` | array of strings | No | Place labels to filter by. |
| `artists` | array of strings | No | Artist labels to filter by. |
| `organizations` | array of strings | No | Organization labels to filter by. |
| `types` | array of strings | No | Event type labels to filter by. |
| `languages` | string | No (default `en`) | Language for matching/labels. |
| `limit` | integer (1–50) | No (default 25) | Max number of results. |

**Output**

```json
{
  "results": [
    {
      "id": "string",
      "name": "string",
      "description": "string",
      "type": [ { "id": "uri", "name": "string" } ],
      "uri": "uri"
    }
  ]
}
```

**Example call**

```json
{
  "name": "search_events",
  "arguments": {
    "places": ["Montreal"],
    "types": ["Theatre"],
    "limit": 10
  }
}
```

## REST-style equivalents

A subset of this functionality is also available as plain REST/JSON
endpoints on the same host, for clients that don't speak MCP:

| Method & Path | Equivalent tool |
|---|---|
| `GET /search-entities?query=<text>&lang=en\|fr` | `search_entities` |
| `GET /entities?id=<uri_or_id>&lang=en\|fr` | `get_entity` |

Full OpenAPI documentation for these REST endpoints is available at:

- Swagger UI: `/api-docs`
- OpenAPI spec: `/api-docs/v1/swagger.yaml`

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






