# -*- encoding: utf-8 -*-
# stub: ebnf 2.6.0 ruby lib

Gem::Specification.new do |s|
  s.name = "ebnf".freeze
  s.version = "2.6.0".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "bug_tracker_uri" => "https://github.com/dryruby/ebnf/issues", "documentation_uri" => "https://dryruby.github.io/ebnf", "homepage_uri" => "https://github.com/dryruby/ebnf", "source_code_uri" => "https://github.com/dryruby/ebnf" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Gregg Kellogg".freeze]
  s.date = "2024-12-01"
  s.description = "EBNF is a Ruby parser for W3C EBNF and a parser generator for PEG and LL(1). Also includes parsing modes for ISO EBNF and ABNF.".freeze
  s.email = "public-rdf-ruby@w3.org".freeze
  s.executables = ["ebnf".freeze]
  s.files = ["bin/ebnf".freeze]
  s.homepage = "https://github.com/dryruby/ebnf".freeze
  s.licenses = ["Unlicense".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 3.0".freeze)
  s.rubygems_version = "3.5.22".freeze
  s.summary = "EBNF parser and parser generator in Ruby.".freeze

  s.installed_by_version = "3.6.7".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<sxp>.freeze, ["~> 2.0".freeze])
  s.add_runtime_dependency(%q<scanf>.freeze, ["~> 1.0".freeze])
  s.add_runtime_dependency(%q<rdf>.freeze, ["~> 3.3".freeze])
  s.add_runtime_dependency(%q<htmlentities>.freeze, ["~> 4.3".freeze])
  s.add_runtime_dependency(%q<unicode-types>.freeze, ["~> 1.8".freeze])
  s.add_runtime_dependency(%q<base64>.freeze, ["~> 0.2".freeze])
  s.add_development_dependency(%q<amazing_print>.freeze, ["~> 1.4".freeze])
  s.add_development_dependency(%q<rdf-spec>.freeze, ["~> 3.3".freeze])
  s.add_development_dependency(%q<rdf-turtle>.freeze, ["~> 3.3".freeze])
  s.add_development_dependency(%q<nokogiri>.freeze, ["~> 1.15".freeze, ">= 1.15.4".freeze])
  s.add_development_dependency(%q<erubis>.freeze, ["~> 2.7".freeze])
  s.add_development_dependency(%q<rspec>.freeze, ["~> 3.12".freeze])
  s.add_development_dependency(%q<rspec-its>.freeze, ["~> 1.3".freeze])
  s.add_development_dependency(%q<yard>.freeze, ["~> 0.9".freeze])
  s.add_development_dependency(%q<rake>.freeze, ["~> 13.0".freeze])
end
