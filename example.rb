require 'httparty'
require 'pry'

APP_ID = 'nike'
BASE_URL = 'https://api.nike.com'

class Person

  def initialize(access_token)
    self.access_token = access_token
  end

  def data
    @data ||= begin
      api_request('/me/sport').parsed_response
    end
  end

  private

  def access_token
    @access_token
  end

  def access_token=(value)
    @access_token = value
  end

  def api_request(endpoint)
    options = { headers: { 'Accept' => 'application/json' } }
    url ="#{BASE_URL}#{endpoint}?access_token=#{access_token}"
    url = "https://api.nike.com/v1/me/sport?access_token=O8N31HbxjMPFadDLTRdXiPvfxcQQ&_=1431792350948"
    binding.pry
    HTTParty.get(url, options)
  end

end

p = Person.new('O8N31HbxjMPFadDLTRdXiPvfxcQQ')
a = p.data # => {"experienceTypes"=>["FUELBAND"], "summaries"=>[{"experienceType"=>"ALL", "records"=>{"lifetimeFuel"=>142358}} ... ]}
puts a
