# frozen_string_literal: true

require_relative "test_helper"

# Tests for the shacl/shacl_artsdata_*.ttl class files (common + one per
# main class), which are always loaded together as a single shapes graph.
#
# Exercises the Artsdata CORE graph shapes for Event, LivePerformanceWork,
# Organization, Place and Person, including the controlled-vocabulary and
# deprecated-concept checks (ads:EventTypeConceptShape,
# ads:GenreConceptShape, ads:OrganizationTypeConceptShape,
# ads:PlaceTypeConceptShape).
#
# Run with: bundle exec rake test   (from shacl/tests, see README.md)
class TestShaclCore < Minitest::Test
  include ShaclTestHelper

  SHAPE_FILES = %w[
    shacl_artsdata_common.ttl
    shacl_artsdata_event.ttl
    shacl_artsdata_liveperformancework.ttl
    shacl_artsdata_organization.ttl
    shacl_artsdata_place.ttl
    shacl_artsdata_person.ttl
  ].freeze

  class << self
    def report
      @report ||= ShaclTestHelper.run_validation(
        SHAPE_FILES.map { |f| File.join(ShaclTestHelper::SHACL_DIR, f) },
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

    def warnings
      @warnings ||= ShaclTestHelper.focus_nodes_with_severity(report, ShaclTestHelper::SH.Warning)
    end
  end

  def violations
    self.class.violations
  end

  def warnings
    self.class.warnings
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
    # ads:DescriptionShape self-targets on the value of
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

  def test_event_type_from_wrong_vocabulary_is_violation
    # adr:Amphitheatre is a real, current adr: skos:Concept -- just from the
    # wrong vocabulary (place types, not event types). ads:HasEventTypeConceptSh
    # only checks that the value is an adr: IRI and a skos:Concept;
    # ads:EventTypeConceptShape (self-targeting on the concept itself) adds
    # the skos:inScheme check that actually catches this, so the reported
    # focus node is the concept, not the event.
    assert_includes violations, adr("Amphitheatre")
  end

  def test_valid_genre_produces_no_violation_on_the_concept_itself
    # adr:K6-100 is a real, current genre concept (see adr:show1).
    refute_includes violations, adr("K6-100")
  end

  def test_genre_from_wrong_vocabulary_is_violation
    # adr:Arena is a place type concept, not a genre. ads:GenreConceptShape
    # self-targets on the value of ado:hasGenre, so the reported focus node
    # is the concept itself, not the LivePerformanceWork.
    assert_includes violations, adr("Arena")
  end

  def test_organization_type_from_wrong_vocabulary_is_violation
    # adr:Arena is a place type concept, not an organization type.
    # ads:OrganizationTypeConceptShape self-targets on the value of
    # ado:hasOrganizationTypeConcept, so the reported focus node is the
    # concept itself, not the Organization.
    assert_includes violations, adr("Arena")
  end

  def test_deprecated_event_type_is_warning_not_violation
    # adr:AcappellaMusicPerformance is deprecated but still a valid Event
    # Types concept, so this must warn, not fail hard. The deprecated-concept
    # check is a property of ads:EventTypeConceptShape (self-targeting), so
    # the focus node is the concept itself.
    assert_includes warnings, adr("AcappellaMusicPerformance")
    refute_includes violations, adr("AcappellaMusicPerformance")
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
