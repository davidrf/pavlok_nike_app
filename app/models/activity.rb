class Activity < ActiveRecord::Base
  ACCESS_TOKEN ="f917SrLNMb2GpJ8mWwMSyKnkHT7a"
  BASE_URL = "https://api.nike.com/v1/me/sport"
  IMPORTANT_NUMBER = "1431792350948"
  OPTIONS = { headers: { 'Accept' => 'application/json' } }

  def self.getdata
    path = "/activities"
    query = "?access_token=#{ACCESS_TOKEN}&_=#{IMPORTANT_NUMBER}"
    url = BASE_URL + path + query
    response = HTTParty.get(url, OPTIONS).parsed_response

    response["data"].each do |activity|
      new_activity = Activity.find_or_create_by!(nike_activity_id: activity["activityId"])
      new_activity.calories = activity["metricSummary"]["calories"].to_i
      new_activity.distance = activity["metricSummary"]["distance"].to_f

      duration_array = activity["metricSummary"]["duration"].split(":")
      duration = duration_array[0].to_i * 3600 + duration_array[1].to_i * 60 + duration_array[2].to_f
      new_activity.duration = duration

      new_activity.save!
    end
  end
end
