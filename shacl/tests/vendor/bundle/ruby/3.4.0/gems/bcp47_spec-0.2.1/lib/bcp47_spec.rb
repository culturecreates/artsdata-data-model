# frozen_string_literal: true

require 'bcp47_spec/parser'
require 'bcp47_spec/version'

module BCP47
  class InvalidLanguageTag < StandardError; end

  Tag = Struct.new(:language, :script, :region, :variants, :extensions, :private)

  class << self
    def valid?(language_tag)
      !Parser.parse(language_tag).nil?
    end

    def parse(language_tag)
      result = Parser.parse(language_tag)
      raise InvalidLanguageTag, "Invalid language tag: #{language_tag}" unless result

      fields = %w[language script region variants extensions private]
      Tag.new(*result.values_at(*fields))
    end
  end
end
