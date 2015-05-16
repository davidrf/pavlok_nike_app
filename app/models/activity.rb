class Activity
  ACCESS_TOKEN ="f917SrLNMb2GpJ8mWwMSyKnkHT7a"
  BASE_URL = "https://api.nike.com/v1/me/sport"
  IMPORTANT_NUMBER = "1431792350948"
  OPTIONS = { headers: { 'Accept' => 'application/json' } }

  def self.all
    path = "/activities"
    query = "?access_token=#{ACCESS_TOKEN}&_=#{IMPORTANT_NUMBER}"
    url = BASE_URL + path + query
    binding.pry
    HTTParty.get(url, OPTIONS).parsed_response
  end

  def self.find(id)
    path = "/activities/#{id}"
    query = "?access_token=#{ACCESS_TOKEN}&_=#{IMPORTANT_NUMBER}"
    url = BASE_URL + path + query
    HTTParty.get(url, OPTIONS).parsed_response
  end
end
