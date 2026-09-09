# -*- encoding: utf-8 -*-
# stub: rdf 3.3.4 ruby lib

Gem::Specification.new do |s|
  s.name = "rdf".freeze
  s.version = "3.3.4".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "bug_tracker_uri" => "https://github.com/ruby-rdf/rdf/issues", "documentation_uri" => "https://ruby-rdf.github.io/rdf", "homepage_uri" => "https://github.com/ruby-rdf/rdf", "mailing_list_uri" => "https://lists.w3.org/Archives/Public/public-rdf-ruby/", "source_code_uri" => "https://github.com/ruby-rdf/rdf" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Arto Bendiken".freeze, "Ben Lavender".freeze, "Gregg Kellogg".freeze]
  s.date = "2025-07-13"
  s.description = "RDF.rb is a pure-Ruby library for working with Resource Description Framework (RDF) data.".freeze
  s.email = "public-rdf-ruby@w3.org".freeze
  s.executables = ["rdf".freeze]
  s.files = ["bin/rdf".freeze]
  s.homepage = "https://github.com/ruby-rdf/rdf".freeze
  s.licenses = ["Unlicense".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 3.0".freeze)
  s.rubygems_version = "3.6.7".freeze
  s.summary = "A Ruby library for working with Resource Description Framework (RDF) data.".freeze

  s.installed_by_version = "3.6.7".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<bcp47_spec>.freeze, ["~> 0.2".freeze])
  s.add_runtime_dependency(%q<bigdecimal>.freeze, ["~> 3.1".freeze, ">= 3.1.5".freeze])
  s.add_runtime_dependency(%q<link_header>.freeze, ["~> 0.0".freeze, ">= 0.0.8".freeze])
  s.add_runtime_dependency(%q<logger>.freeze, ["~> 1.5".freeze])
  s.add_runtime_dependency(%q<ostruct>.freeze, ["~> 0.6".freeze])
  s.add_runtime_dependency(%q<readline>.freeze, ["~> 0.0".freeze])
  s.add_development_dependency(%q<base64>.freeze, ["~> 0.2".freeze])
  s.add_development_dependency(%q<rdf-spec>.freeze, ["~> 3.3".freeze])
  s.add_development_dependency(%q<rdf-turtle>.freeze, ["~> 3.3".freeze])
  s.add_development_dependency(%q<rdf-vocab>.freeze, ["~> 3.3".freeze])
  s.add_development_dependency(%q<rdf-xsd>.freeze, ["~> 3.3".freeze])
  s.add_development_dependency(%q<rest-client>.freeze, ["~> 2.1".freeze])
  s.add_development_dependency(%q<rspec>.freeze, ["~> 3.13".freeze])
  s.add_development_dependency(%q<rspec-its>.freeze, ["~> 1.3".freeze])
  s.add_development_dependency(%q<webmock>.freeze, ["~> 3.23".freeze])
  s.add_development_dependency(%q<yard>.freeze, ["~> 0.9".freeze])
  s.add_development_dependency(%q<faraday>.freeze, ["~> 1.10".freeze])
  s.add_development_dependency(%q<faraday_middleware>.freeze, ["~> 1.2".freeze])
end
