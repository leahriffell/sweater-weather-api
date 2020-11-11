class RoadTripDetails
  attr_reader :start_city,
              :end_city,
              :travel_time,
              :weather_at_eta

  def initialize(trip, weather)
    @start_city = trip[:start_city]
    @end_city = trip[:end_city]
    @travel_time = trip[:travel_time]
    @weather_at_eta = weather_at_arrival(weather)
  end

  def weather_at_arrival(weather)
    if weather == ""
      { temperature: '', conditions: '' }
    else
      { temperature: weather[:temp], conditions: weather[:weather][0][:description] }
    end
  end
end