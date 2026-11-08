# Ontology graph generators

Scripts that compare an ontology file in `ontology/` with its named graph in Artsdata's GraphDB, and write the SPARQL to bring the graph up to date.

Each file `ontology/<name>.ttl` lives in the graph `http://kg.artsdata.ca/culture-creates/artsdata-data-model/<name>`.

`artsdata-ontology.ttl` is not loaded by the [Push Ontology file](../../.github/workflows/push-ontology-file.yml) workflow. Its graph is updated in place with `gen_update.py`. The SKOS vocabularies are still loaded by that workflow, but the scripts work for them too.

## Setup

```bash
cd ontology/generators
pip install -r requirements.txt
```

## Update the graph after changing the file

1. Bump `owl:versionInfo` and `dcterms:modified` in the file, and add a `# V x.y.z` entry to the changelog comment at the top.
2. Generate the update:
   ```bash
   python3 gen_update.py ../artsdata-ontology.ttl > update.ru
   ```
   The script downloads the live graph, writes `DELETE DATA` for triples that are no longer in the file and `INSERT DATA` for new ones, and checks that the update applied to that download gives exactly the file. It prints a summary to stderr, or says the graph already matches.
3. Paste `update.ru` into the GraphDB Workbench SPARQL editor (repository `artsdata`) and run it. Alternatively, POST it with an account that can write:
   ```bash
   curl -u <user> -H 'Content-Type: application/sparql-update' \
     --data-binary @update.ru https://db.artsdata.ca/repositories/artsdata/statements
   ```
4. Confirm with `gen_update.py` again: it should report that the graph already matches.

The update is an exact diff against the graph at download time, so run it soon after generating it. If the graph changed in between, `DELETE DATA` skips triples that are gone and the old values can remain next to the new ones.

Options:
- `--graph URI` targets a different graph, e.g. on staging.
- `--live FILE.nt` diffs against a saved N-Triples copy instead of downloading the graph.

## Compare without changing anything

```bash
python3 gen_diff.py ../artsdata-ontology.ttl > diff.rq
curl -H 'Accept: text/csv' -H 'Content-Type: application/sparql-query' \
  --data-binary @diff.rq https://db.artsdata.ca/repositories/artsdata
```

`diff.rq` is a read-only SELECT with the file's triples written into it. Each row is tagged `only in file` or `only in graph`.

## Notes

- **Use the GraphDB endpoint for large queries.** Send these queries to `https://db.artsdata.ca/repositories/artsdata`. `https://query.artsdata.ca/query` forwards requests as GET and rejects large queries with "414 Request-URI Too Large".
- **Load metadata is left alone.** A Databus load adds triples to the graph that are not in the file:
  - a SHACL validation report (blank nodes)
  - dataset and provenance metadata whose subject is the graph URI or `<graph>#Activity`

  `gen_update.py` never deletes these, and `gen_diff.py` lists them as `only in graph`.
- **No blank nodes in the files.** The scripts assume the ontology files have no blank nodes; `gen_update.py` stops if one does.
