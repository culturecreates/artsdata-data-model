"""Write a SPARQL Update (DELETE DATA / INSERT DATA) that brings an ontology's
named graph in GraphDB in line with the ontology file.

The script downloads the live graph, computes the difference, and checks
before printing that the update applied to that download gives exactly the
file. Triples the Databus load adds to the graph (the SHACL validation report
and the dataset/provenance metadata about the graph) are left untouched.

The update is an exact diff against the graph as it was when downloaded:
run it soon after generating it, or regenerate it.

usage: python3 gen_update.py ../artsdata-ontology.ttl [--graph URI] [--live FILE.nt] > update.ru
"""
import argparse
import sys

import rdflib

from artsdata_graph import added_by_load, fetch_live, graph_uri, has_bnode, load_file, ntriple


def build_update(graph, deletes, inserts, source):
    def block(keyword, triples):
        body = "\n".join(f"    {ntriple(t)}" for t in triples)
        return f"{keyword} {{\n  GRAPH <{graph}> {{\n{body}\n  }}\n}}"

    parts = []
    if deletes:
        parts.append(block("DELETE DATA", deletes))
    if inserts:
        parts.append(block("INSERT DATA", inserts))
    header = (
        f"# Brings <{graph}>\n"
        f"# in line with {source}: {len(deletes)} triples deleted, {len(inserts)} inserted.\n"
    )
    return header + " ;\n".join(parts)


def check(update, graph, live, local):
    """Apply the update to a copy of the live graph and compare with the file."""
    dataset = rdflib.Dataset()
    copy = dataset.graph(rdflib.URIRef(graph))
    for triple in live:
        copy.add(triple)
    dataset.update(update)
    result = {t for t in dataset.graph(rdflib.URIRef(graph)) if not added_by_load(t, graph)}
    return result == set(local)


def main():
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("ttl", help="ontology file, e.g. ontology/artsdata-ontology.ttl")
    parser.add_argument("--graph", help="named graph (default: derived from the file name)")
    parser.add_argument("--live", help="use a saved N-Triples copy of the graph instead of downloading it")
    args = parser.parse_args()

    graph = args.graph or graph_uri(args.ttl)
    local = load_file(args.ttl)
    if args.live:
        live = rdflib.Graph().parse(args.live, format="nt")
    else:
        live = fetch_live(graph)

    if any(has_bnode(t) for t in local):
        sys.exit("The file contains blank nodes: DELETE DATA / INSERT DATA cannot match them reliably.")
    if any(added_by_load(t, graph) for t in local):
        sys.exit(f"The file has triples about <{graph}> itself, which this script treats as load metadata.")
    if len(live) == 0:
        sys.exit(f"The graph <{graph}> is empty or does not exist, so there is nothing to diff against.")

    deletes = sorted(t for t in live if not added_by_load(t, graph) and t not in local)
    inserts = sorted(t for t in local if t not in live)
    if not deletes and not inserts:
        print(f"<{graph}> already matches {args.ttl}; no update needed.", file=sys.stderr)
        return

    update = build_update(graph, deletes, inserts, args.ttl)
    if not check(update, graph, live, local):
        sys.exit("Check failed: applying the update to the downloaded graph does not give the file.")

    print(update)
    print(
        f"{len(deletes)} deletes, {len(inserts)} inserts; check passed. "
        f"{sum(added_by_load(t, graph) for t in live)} triples added by the load left untouched.",
        file=sys.stderr,
    )


if __name__ == "__main__":
    main()
