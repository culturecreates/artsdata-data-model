# frozen_string_literal: true

require "set"
require "rdf"
require "rdf/turtle"
require "shacl"
require "minitest/autorun"

# Shared helpers for running the `shacl` gem against the Artsdata SHACL
# shape files. Required directly by the test_shacl_*.rb files in this
# directory (see README.md for how to run them).
module ShaclTestHelper
  TESTS_DIR    = File.expand_path(__dir__)
  REPO_ROOT    = File.expand_path("../..", TESTS_DIR)
  SHACL_DIR    = File.join(REPO_ROOT, "shacl")
  ONTOLOGY_DIR = File.join(REPO_ROOT, "ontology")
  FIXTURES_DIR = File.join(TESTS_DIR, "fixtures")

  SH = RDF::Vocabulary.new("http://www.w3.org/ns/shacl#")

  module_function

  def load_graph(*paths)
    graph = RDF::Graph.new
    paths.each { |path| graph.load(path.to_s) }
    graph
  end

  # Runs shapes_paths against data_paths and returns a SHACL::ValidationReport.
  def run_validation(shapes_paths, data_paths)
    shapes_graph = load_graph(*shapes_paths)
    data_graph = load_graph(*data_paths)
    SHACL.get_shapes(shapes_graph).execute(data_graph)
  end

  # Returns the Set of every sh:focusNode reported at the given severity
  # (e.g. SH.Violation or SH.Warning), across all shapes.
  def focus_nodes_with_severity(report, severity)
    report.results
          .select { |result| result.resultSeverity == severity }
          .map(&:focus)
          .to_set
  end

  def adr(name)
    RDF::URI("http://kg.artsdata.ca/resource/#{name}")
  end

  def ext(name)
    RDF::URI("http://example-provider.com/#{name}")
  end
end
