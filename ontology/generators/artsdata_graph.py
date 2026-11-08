"""Shared helpers for comparing an ontology file with its named graph in Artsdata's GraphDB.

Each file ontology/<artifact>.ttl is loaded by the "Push Ontology file" workflow
into the graph http://kg.artsdata.ca/culture-creates/artsdata-data-model/<artifact>.
"""
import pathlib
import urllib.request

import rdflib

# Queries go to GraphDB directly: the query.artsdata.ca proxy forwards requests
# as GET and rejects large queries with "414 Request-URI Too Large".
ENDPOINT = "https://db.artsdata.ca/repositories/artsdata"
GRAPH_BASE = "http://kg.artsdata.ca/culture-creates/artsdata-data-model/"


def graph_uri(ttl_path):
    """Named graph that holds the given ontology file."""
    return GRAPH_BASE + pathlib.Path(ttl_path).stem


def load_file(ttl_path):
    return rdflib.Graph().parse(ttl_path, format="turtle")


def fetch_live(graph, endpoint=ENDPOINT):
    """Download every triple of a named graph."""
    query = f"CONSTRUCT {{ ?s ?p ?o }} WHERE {{ GRAPH <{graph}> {{ ?s ?p ?o }} }}"
    request = urllib.request.Request(
        endpoint,
        data=query.encode("utf-8"),
        headers={
            "Content-Type": "application/sparql-query",
            "Accept": "application/n-triples",
        },
    )
    with urllib.request.urlopen(request, timeout=120) as response:
        return rdflib.Graph().parse(data=response.read().decode("utf-8"), format="nt")


def has_bnode(triple):
    return any(isinstance(term, rdflib.BNode) for term in triple)


def added_by_load(triple, graph):
    """True for triples the Databus load writes into the graph, not taken from the file:
    the SHACL validation report (blank nodes) and the dataset/provenance metadata
    whose subject is the graph itself or <graph>#Activity."""
    subject = str(triple[0])
    return has_bnode(triple) or subject == graph or subject.startswith(graph + "#")


def ntriple(triple):
    s, p, o = triple
    return f"{s.n3()} {p.n3()} {o.n3()} ."
