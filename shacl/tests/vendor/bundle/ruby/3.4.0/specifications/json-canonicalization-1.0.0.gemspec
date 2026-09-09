# -*- encoding: utf-8 -*-
# stub: json-canonicalization 1.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "json-canonicalization".freeze
  s.version = "1.0.0".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "bug_tracker_uri" => "https://github.com/dryruby/json-canonicalization/issues", "documentation_uri" => "https://dryruby.github.io/json-canonicalization", "homepage_uri" => "https://github.com/dryruby/json-canonicalization", "source_code_uri" => "https://github.com/dryruby/json-canonicalization" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Gregg Kellogg".freeze]
  s.date = "2023-12-04"
  s.description = "JSON::Canonicalization generates canonical JSON output from Ruby objects.".freeze
  s.homepage = "http://github.com/dryruby/json-canonicalization".freeze
  s.licenses = ["Unlicense".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 3.0".freeze)
  s.rubygems_version = "3.4.19".freeze
  s.summary = "JSON Canonicalization for Ruby.".freeze

  s.installed_by_version = "3.6.7".freeze

  s.specification_version = 4

  s.add_development_dependency(%q<rspec>.freeze, ["~> 3.12".freeze])
  s.add_development_dependency(%q<yard>.freeze, ["~> 0.9".freeze])
end
