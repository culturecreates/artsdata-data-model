# frozen_string_literal: true

require_relative "test_helper"

# Tests that shacl_artsdata_core.ttl and shacl_artsdata_ontology.ttl can be
# loaded together against the CORE graph fixture: the ontology file's
# self-targeting concept shapes (ads:EventTypeConceptShape,
# ads:PlaceTypeConceptShape, ads:GenreConceptShape) should add the
# vocabulary-scheme-membership check on top of what the core file already
# enforces, without producing false positives on valid data.
#
# Run with: bundle exec rake test   (from shacl/tests, see README.md)
class TestShaclCombined < Minitest::Test
  include ShaclTestHelper

  class << self
    def report
      @report ||= ShaclTestHelper.run_validation(
        [
          File.join(ShaclTestHelper::SHACL_DIR, "shacl_artsdata_core.ttl"),
          File.join(ShaclTestHelper::SHACL_DIR, "shacl_artsdata_ontology.ttl")
        ],
        [
          File.join(ShaclTestHelper::FIXTURES_DIR, "core-graph-fixture.ttl"),
          File.join(ShaclTestHelper::ONTOLOGY_DIR, "skos-genres.ttl"),
          File.join(ShaclTestHelper::ONTOLOGY_DIR, "skos-event-types.ttl"),
          File.join(ShaclTestHelper::ONTOLOGY_DIR, "skos-place-types.ttl")
        ]
      )
    end

    def violations
      @violations ||= ShaclTestHelper.focus_nodes_with_severity(report, ShaclTestHelper::SH.Violation)
    end
  end

  def violations
    self.class.violations
  end

  def test_valid_genre_produces_no_violation_on_the_concept_itself
    # adr:K6-100 is a real, current genre concept.
    refute_includes violations, adr("K6-100")
  end

  def test_wrong_vocabulary_concept_is_flagged_via_scheme_membership
    # adr:Amphitheatre is used (invalidly) as an event type in the fixture;
    # the ontology file's ads:EventTypeConceptShape checks skos:inScheme
    # directly on the concept, so the focus node here is the concept
    # itself, not the event.
    assert_includes violations, adr("Amphitheatre")
  end
end
