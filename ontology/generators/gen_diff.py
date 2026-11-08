"""Write a read-only SPARQL query that lists the differences between an ontology
file and its named graph in GraphDB.

The file's triples are written into the query, so it needs no write access.
Each result row is tagged "only in file" or "only in graph".

usage: python3 gen_diff.py ../artsdata-ontology.ttl [--graph URI] > diff.rq
"""
import argparse

from artsdata_graph import graph_uri, load_file


def main():
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("ttl", help="ontology file, e.g. ontology/artsdata-ontology.ttl")
    parser.add_argument("--graph", help="named graph (default: derived from the file name)")
    args = parser.parse_args()

    graph = args.graph or graph_uri(args.ttl)
    local = load_file(args.ttl)
    rows = "\n".join(f"      ({s.n3()} {p.n3()} {o.n3()})" for s, p, o in sorted(local))

    print(f"""# Differences between {args.ttl} (inlined below) and the graph
# <{graph}>
SELECT ?change ?s ?p ?o WHERE {{
  {{
    VALUES (?s ?p ?o) {{
{rows}
    }}
    FILTER NOT EXISTS {{ GRAPH <{graph}> {{ ?s ?p ?o }} }}
    BIND("only in file" AS ?change)
  }}
  UNION
  {{
    GRAPH <{graph}> {{ ?s ?p ?o }}
    MINUS {{
      VALUES (?s ?p ?o) {{
{rows}
      }}
    }}
    BIND("only in graph" AS ?change)
  }}
}}
ORDER BY ?change ?s ?p ?o
LIMIT 1000""")


if __name__ == "__main__":
    main()
