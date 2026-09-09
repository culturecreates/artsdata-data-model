# -*- encoding: utf-8 -*-
# stub: htmlentities 4.4.2 ruby lib

Gem::Specification.new do |s|
  s.name = "htmlentities".freeze
  s.version = "4.4.2".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Paul Battley".freeze]
  s.date = "2025-11-20"
  s.description = "A module for encoding and decoding (X)HTML entities.".freeze
  s.email = "pbattley@gmail.com".freeze
  s.extra_rdoc_files = ["History.txt".freeze, "COPYING.txt".freeze]
  s.files = ["COPYING.txt".freeze, "History.txt".freeze]
  s.homepage = "https://github.com/threedaymonk/htmlentities".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.7.0".freeze)
  s.rubygems_version = "3.6.2".freeze
  s.summary = "Encode/decode HTML entities".freeze

  s.installed_by_version = "3.6.7".freeze

  s.specification_version = 4

  s.add_development_dependency(%q<rake>.freeze, ["~> 13".freeze])
  s.add_development_dependency(%q<rspec>.freeze, ["~> 3".freeze])
  s.add_development_dependency(%q<benchmark>.freeze, [">= 0".freeze])
  s.add_development_dependency(%q<ruby-prof>.freeze, [">= 0".freeze])
end
