# frozen_string_literal: true

require 'HTTParty'
require 'erb'

# This Class uses SPARQL to query a remote triple store and return JSON data
class GenerateData
  include ERB::Util

  def initialize; end

  def self.event
    sparql 'Event'
  end

  def self.person
    sparql 'Person'
  end

  def self.place
    sparql 'Place'
  end

  def self.sparql(name)
    event_sparql = ERB::Util.url_encode(
      File.read("sparql/event-properties.sparql").sub('schema:Event', "schema:#{name}")
    )
    response = HTTParty.get(
      "http://db.artsdata.ca/repositories/artsdata?query=#{event_sparql}",
      { headers: { 'Accept' => 'application/json' } }
    )

    File.write("_data/#{name}-properties.json", response.body)
  end
end

GenerateData.event
GenerateData.person
GenerateData.place
