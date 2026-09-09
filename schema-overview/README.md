---
title: Schema Overview
layout: default
---

# Artsdata Schema Overview

Every class and property in the Artsdata data model, extracted from its ontology and SHACL shapes. Click a class to expand it and see its properties -- cardinality, type/range, constraints (patterns, enumerations, controlled-vocabulary membership, deprecation warnings) and definitions.

<a href="index.html" target="_blank" rel="noopener">Open in a full page &rarr;</a>

<iframe src="index.html" title="Artsdata Schema Overview" style="width: 100%; height: 85vh; border: 1px solid #d8dee4; border-radius: 8px;"></iframe>

---

`index.html`, embedded above, is a generated file -- do not edit it directly. It's built from [`../artsdata-schema.ttl`](../artsdata-schema.ttl) alone by [`../_generators/generate_schema_overview.rb`](../_generators/generate_schema_overview.rb), which runs automatically at the end of `generate_mcp_schema.rb` (see the root [README](../README.md#generating-the-combined-mcp-schema-file)), so it always regenerates together with `artsdata-schema.ttl`.

To regenerate it locally:

```sh
cd _generators
bundle install   # first time only
bundle exec ruby generate_mcp_schema.rb
```
