# frozen_string_literal: true

require_relative "test_helper"

# Tests for shacl/shacl_artsdata_core.ttl.
#
# Exercises the Artsdata CORE graph shapes for Event, LivePerformanceWork,
# Organization, Place and Person.
#
# Run with: bundle exec rake test   (from shacl/tests, see README.md)
class TestShaclCore < Minitest::Test
  include ShaclTestHelper

  class << self
    def report
      @report ||= ShaclTestHelper.run_validation(
        [File.join(ShaclTestHelper::SHACL_DIR, "shacl_artsdata_core.ttl")],
        [
          File.join(ShaclTestHelper::FIXTURES_DIR, "core-graph-fixture.ttl"),
          File.join(ShaclTestHelper::ONTOLOGY_DIR, "skos-genres.ttl"),
          File.join(ShaclTestHelper::ONTOLOGY_DIR, "skos-event-types.ttl"),
          File.join(ShaclTestHelper::ONTOLOGY_DIR, "skos-place-types.ttl"),
          File.join(ShaclTestHelper::ONTOLOGY_DIR, "skos-organization-types.ttl")
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

  def test_fixture_does_not_conform
    refute self.class.report.conform?
  end

  # ---- valid fixtures: must have zero violations ----

  def test_valid_place_has_no_violations
    refute_includes violations, adr("place1")
  end

  def test_valid_organization_has_no_violations
    refute_includes violations, adr("org1")
  end

  def test_valid_event_has_no_violations
    refute_includes violations, adr("event1")
  end

  def test_valid_live_performance_work_has_no_violations
    refute_includes violations, adr("show1")
  end

  def test_valid_person_has_no_violations
    refute_includes violations, adr("person1")
  end

  # ---- invalid fixtures: each must be flagged ----

  def test_missing_name_is_violation
    assert_includes violations, adr("place2")
  end

  def test_blank_description_is_violation
    # ads:CoreDescriptionShape self-targets on the value of
    # schema:description (sh:targetObjectsOf), so the reported focus node
    # is the literal itself, not the entity that holds it.
    assert_includes violations, RDF::Literal("   ")
  end

  def test_html_only_description_is_violation
    assert_includes violations, RDF::Literal("<p></p>  <br/>")
  end

  def test_url_as_plain_string_is_violation
    assert_includes violations, adr("place5")
  end

  def test_organizer_pointing_to_non_adr_uri_is_violation
    assert_includes violations, adr("event2")
  end

  def test_event_missing_location_is_violation
    assert_includes violations, adr("event3")
  end

  def test_event_type_pointing_to_non_adr_uri_is_violation
    assert_includes violations, adr("event4")
  end

  def test_event_type_from_wrong_vocabulary_not_flagged_by_core_alone
    # adr:Amphitheatre is a real, current adr: skos:Concept -- just from the
    # wrong vocabulary (place types, not event types). This file's
    # ads:CoreHasEventTypeConceptSh only checks that the value is an adr:
    # IRI and a skos:Concept, so it does NOT catch this on its own. See
    # test_shacl_combined.rb for the vocabulary-scheme check, which lives in
    # shacl_artsdata_ontology.ttl.
    refute_includes violations, adr("event5")
  end

  def test_place_type_pointing_to_non_adr_uri_is_violation
    assert_includes violations, adr("place6")
  end

  def test_managed_by_two_organizations_is_violation
    assert_includes violations, adr("place7")
  end

  def test_managed_by_person_is_violation
    assert_includes violations, adr("place8")
  end

  def test_uses_expression_of_pointing_to_non_adr_uri_is_violation
    assert_includes violations, adr("show2")
  end

  def test_canadian_business_number_wrong_pattern_is_violation
    assert_includes violations, adr("org3")
  end

  def test_organization_type_pointing_to_non_adr_uri_is_violation
    assert_includes violations, adr("org4")
  end
end
