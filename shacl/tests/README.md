# SHACL shape tests

Unit tests for the SHACL shape files in `shacl/`, run with the [`shacl`
gem](https://rubygems.org/gems/shacl) (a pure-Ruby SHACL engine from the
[Ruby RDF](https://github.com/ruby-rdf) project) via
[Minitest](https://github.com/minitest/minitest).

| Test file | Validates | Fixture |
|---|---|---|
| `test_shacl_ontology.rb` | `shacl/shacl_artsdata_ontology.ttl` | `fixtures/ontology-fixture.ttl` |
| `test_shacl_core.rb` | `shacl/shacl_artsdata_core.ttl` | `fixtures/core-graph-fixture.ttl` |
| `test_shacl_combined.rb` | both files loaded together | `fixtures/core-graph-fixture.ttl` |

Each fixture is a small hand-written Turtle graph mixing valid and
deliberately-invalid entities. Fixtures are loaded together with the real
controlled vocabularies under `ontology/skos-*.ttl` (not copies of them),
so tests stay in sync with the actual vocabulary content. Tests assert
which entities do/don't appear in the SHACL validation report at a given
severity — they don't just eyeball printed output.

This has its own `Gemfile`, separate from the one at the repo root (which
is for the Jekyll site), so these dependencies don't leak into that build.

## Setup (one-time)

From the repo root:

```sh
cd shacl/tests
bundle config set path 'vendor/bundle'
bundle install
```

(`shacl/tests/vendor/` and `.bundle/` are gitignored — see `.gitignore`.)

## Running the tests

From `shacl/tests`:

```sh
bundle exec rake test
```

Or run a single file directly (the `-W0` flag silences noisy "literal
string will be frozen in the future" notices from the `shacl` gem's
dependencies (`ebnf`, `sxp`) on newer Rubies — `rake test` already sets
this via `ruby_opts` in the `Rakefile`):

```sh
bundle exec ruby -W0 test_shacl_core.rb
```

## Adding a new case

1. Add the entity to the relevant fixture file, with a comment saying what
   it's testing.
2. Add a test method asserting it does (or doesn't) appear in `violations`
   (or `warnings`) — see `test_helper.rb` for how those are computed.
