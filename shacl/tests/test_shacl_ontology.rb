# frozen_string_literal: true

require_relative "test_helper"

# Tests for shacl/shacl_artsdata_ontology.ttl.
#
# Exercises ado:LivePerformanceWork, ado:Event extensions and schema:Place
# ontology extensions (managedBy/ownedBy/usedBy/hasResident), including the
# controlled-vocabulary and deprecated-concept checks.
#
# Run with: bundle exec rake test   (from shacl/tests, see README.md)
class TestShaclOntology < Minitest::Test
  include ShaclTestHelper

  class << self
    def report
      @report ||= ShaclTestHelper.run_validation(
        [File.join(ShaclTestHelper::SHACL_DIR, "shacl_artsdata_ontology.ttl")],
        [
          File.join(ShaclTestHelper::FIXTURES_DIR, "ontology-fixture.ttl"),
          File.join(ShaclTestHelper::ONTOLOGY_DIR, "skos-genres.ttl"),
          File.join(ShaclTestHelper::ONTOLOGY_DIR, "skos-event-types.ttl"),
          File.join(ShaclTestHelper::ONTOLOGY_DIR, "skos-place-types.ttl")
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
    # The fixture deliberately mixes valid and invalid data.
    refute self.class.report.conform?
  end

  def test_valid_live_performance_work_has_no_violations
    refute_includes violations, ext("show1")
  end

  def test_genre_from_wrong_vocabulary_is_violation
    # adr:Arena is a place type concept, not a genre. ads:GenreConceptShape
    # self-targets on the value of ado:hasGenre, so the reported focus node
    # is the concept itself, not the LivePerformanceWork.
    assert_includes violations, adr("Arena")
  end

  def test_valid_event_has_no_violations
    refute_includes violations, ext("event1")
  end

  def test_deprecated_event_type_is_warning_not_violation
    # adr:AcappellaMusicPerformance is deprecated but still a valid Event
    # Types concept, so this must warn, not fail hard. The deprecated-concept
    # check is a property of ads:EventTypeConceptShape (self-targeting), so
    # the focus node is the concept itself.
    assert_includes warnings, adr("AcappellaMusicPerformance")
    refute_includes violations, adr("AcappellaMusicPerformance")
  end

  def test_valid_place_has_no_violations
    refute_includes violations, ext("venue1")
  end

  def test_managed_by_two_organizations_is_violation
    # ado:managedBy has sh:maxCount 1.
    assert_includes violations, ext("venue2")
  end

  def test_managed_by_person_is_violation
    # ado:managedBy must reference a schema:Organization.
    assert_includes violations, ext("venue3")
  end
end
