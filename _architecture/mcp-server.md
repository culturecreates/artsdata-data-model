---
title: MCP Server
layout: architecture-doc
nav_order: 12
---

The Artsdata MCP Server gives AI agents and LLM-based tools access to the Artsdata knowledge graph through the [Model Context Protocol](https://modelcontextprotocol.io) (MCP). With it, an agent can find events, people, places and organizations in Artsdata, read their details, and write its own SPARQL queries against the data model. It does not need to know Artsdata's APIs or ontology beforehand.

Artsdata is listed in the official [MCP Registry](https://registry.modelcontextprotocol.io/v0.1/servers?search=ca.artsdata/mcp) as `ca.artsdata/mcp`.

## Endpoint

```text
https://mcp.artsdata.ca/mcp
```

| | |
|---|---|
| Transport | Streamable HTTP (JSON-RPC 2.0 over `POST`), stateless: no session ID is issued |
| Authentication | None (public) |
| Agent guide | [https://mcp.artsdata.ca/llms.txt](https://mcp.artsdata.ca/llms.txt) |

Most MCP clients connect by adding this URL as a remote MCP server. No API key is needed.

## How it works

The MCP server holds no data of its own. It is a thin layer over existing Artsdata services, and turns their responses into compact, LLM-friendly results:

- the [Reconciliation API](reconciliation.html), for searching entities and events and for retrieving entity details;
- the [SPARQL Endpoint](sparql.html) (`https://query.artsdata.ca/query`), for read-only SPARQL queries;
- the [Artsdata schema](https://docs.artsdata.ca/artsdata-schema.ttl) published on this site (the Artsdata Ontology plus the SHACL shapes), which it compiles into a summary of the data model;
- the [Databus API](graph-store-api.html), for finding the latest [data dump](data-dumps.html).

## Tools

| Tool | What it does |
|---|---|
| `search_entities` | Finds entities by name: events, places, people, organizations and concepts such as event types. Returns their Artsdata URIs. |
| `get_entity` | Returns the full details of one entity, given its URI, including the datasets it was built from. |
| `search_events` | Searches events by date range, venue, artist, organization and Artsdata event type. Venues, people and organizations are passed as URIs, found with `search_entities` first. |
| `get_schema` | Returns the Artsdata data model (classes, properties, prefixes and controlled vocabularies) so an agent can write correct SPARQL. |
| `sparql_query` | Runs a read-only SPARQL `SELECT` or `ASK` query and returns up to 1,000 rows. |

To answer an open question, an agent calls `get_schema` to learn the model, writes a query and runs it with `sparql_query`, then calls `get_entity` or `search_entities` for more detail on the entities in the results.

## Resources

| Resource | What it returns |
|---|---|
| `artsdata://dumps/core-minus-provenance/latest` | A small JSON manifest (download URL, version, format and compression) for the latest monthly dump of the Artsdata core graph. It does not contain the dump itself. Clients compare `version` between reads to know when a new dump is out. |

## Guidance for agents

The server sends instructions to the agent when it connects. Two of them shape how answers are written:

- **Cite Artsdata IDs.** When an agent mentions an entity that has an Artsdata URI, it gives the Artsdata ID on first mention, for example *Klondike Institute of Art & Culture (K11-70)*, and takes IDs only from tool results.
- **Name the sources.** Artsdata records which datasets each value came from. When asked where a value comes from, the agent gives the value Artsdata asserts and its sources first, then any different values that other sources claim.

## Usage and privacy

Each call to the server is logged, including the arguments the agent sent (search terms, entity URIs, SPARQL queries). Usage statistics (tool name, response time and the client's `User-Agent`) are sent to Google Analytics.

## Source code and documentation

- [artsdata-mcp-server README](https://github.com/culturecreates/artsdata-mcp-server#readme): setup, configuration, deployment and tests
- [MCP server reference](https://github.com/culturecreates/artsdata-mcp-server/blob/main/docs/mcp-server.md): full inputs and outputs of each tool, with example calls
- [Model Context Protocol specification](https://modelcontextprotocol.io)
