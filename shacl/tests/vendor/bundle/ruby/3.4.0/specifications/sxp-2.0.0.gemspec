# -*- encoding: utf-8 -*-
# stub: sxp 2.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "sxp".freeze
  s.version = "2.0.0".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "bug_tracker_uri" => "https://github.com/dryruby/sxp/issues", "documentation_uri" => "https://dryruby.github.io/sxp", "homepage_uri" => "https://github.com/dryruby/sxp", "mailing_list_uri" => "https://lists.w3.org/Archives/Public/public-rdf-ruby/", "rubygems_mfa_required" => "true", "source_code_uri" => "https://github.com/dryruby/sxp" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Arto Bendiken".freeze, "Gregg Kellogg".freeze]
  s.date = "2023-12-20"
  s.description = "Universal S-expression parser with specific support for Common Lisp, Scheme, and RDF/SPARQL".freeze
  s.email = ["arto@bendiken.net".freeze, "gregg@greggkellogg.net".freeze]
  s.executables = ["sxp2rdf".freeze, "sxp2json".freeze, "sxp2xml".freeze, "sxp2yaml".freeze]
  s.files = ["bin/sxp2json".freeze, "bin/sxp2rdf".freeze, "bin/sxp2xml".freeze, "bin/sxp2yaml".freeze]
  s.homepage = "https://github.com/dryruby/sxp/".freeze
  s.licenses = ["Unlicense".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 3.0".freeze)
  s.rubygems_version = "3.4.19".freeze
  s.summary = "A pure-Ruby implementation of a universal S-expression parser.".freeze

  s.installed_by_version = "3.6.7".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<rdf>.freeze, ["~> 3.3".freeze])
  s.add_runtime_dependency(%q<matrix>.freeze, ["~> 0.4".freeze])
  s.add_development_dependency(%q<amazing_print>.freeze, ["~> 1.5".freeze])
  s.add_development_dependency(%q<rspec>.freeze, ["~> 3.12".freeze])
  s.add_development_dependency(%q<yard>.freeze, ["~> 0.9".freeze])
end
