# Artsdata Schema Overview

An interactive webpage listing every class and property in the Artsdata data model: **[index.html](index.html)** (published at [docs.artsdata.ca/schema-overview/](https://docs.artsdata.ca/schema-overview/)).

Each class can be expanded to show its properties in a table, with cardinality, type/range, constraints (patterns, enumerations, controlled-vocabulary membership, deprecation warnings) and definitions -- everything that can be extracted from the ontology and SHACL shapes.

It is a generated file -- do not edit it directly. It's built from [`../artsdata-schema.ttl`](../artsdata-schema.ttl) alone by [`../_generators/generate_schema_overview.rb`](../_generators/generate_schema_overview.rb), which runs automatically at the end of `generate_mcp_schema.rb` (see the root [README](../README.md#generating-the-combined-mcp-schema-file)), so it always regenerates together with `artsdata-schema.ttl`.

To regenerate it locally:

```sh
cd _generators
bundle install   # first time only
bundle exec ruby generate_mcp_schema.rb
```
