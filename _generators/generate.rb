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

  def self.organization
    sparql 'Organization'
  end

  def self.web_page
    sparql 'WebPage'
  end

  def self.offer
    sparql 'Offer'
  end

  def self.postal_address
    sparql 'PostalAddress'
  end

  def self.event_status
    sparql 'EventStatus'
  end

  def self.attendance_mode
    sparql 'AttendanceMode'
  end

  def self.sparql(name)
    event_sparql = ERB::Util.url_encode(sparql_template(name))
    response = HTTParty.get(
      "http://db.artsdata.ca/repositories/artsdata?query=#{event_sparql}",
      { headers: { 'Accept' => 'application/json' } }
    )
    if response.code == 200
      File.write("../_data/generated/#{name}.json", response.body)
      puts "Genreated file #{name}.json"
    else
      puts "#{name} error code: #{response.code}"
    end
  end

  def self.sparql_template(name)
    filename = File.join(
      File.dirname(__FILE__),
      '/sparql/event-properties.sparql'
    )
    File.read(filename)
        .sub('schema:Event', "schema:#{name}") # replace main class name
  end
end

GenerateData.event
GenerateData.person
GenerateData.place
GenerateData.organization
GenerateData.web_page
GenerateData.offer
GenerateData.postal_address
GenerateData.event_status
GenerateData.attendance_mode
