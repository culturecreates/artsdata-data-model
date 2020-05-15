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
    call_sparql name, 'properties'
    call_sparql name, 'definition'
  end

  def self.call_sparql(name, template)
    sparql = ERB::Util.url_encode(sparql_template(name, template))
    response = HTTParty.get(
      "http://db.artsdata.ca/repositories/artsdata?query=#{sparql}",
      { headers: { 'Accept' => 'application/json' } }
    )
    if response.code == 200
      File.write("../_data/generated/#{name}-#{template}.json", response.body)
      puts "Generated #{name} with template #{template}."
    else
      puts "#{name} error code: #{response.code}"
    end
  end

  def self.sparql_template(name, template)
    filename = File.join(
      File.dirname(__FILE__),
      "/sparql/#{template}.sparql"
    )
    File.read(filename)
        .gsub('schema:Event', "schema:#{name}") # replace main class name
     
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
