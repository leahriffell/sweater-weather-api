class RoadTripFacade
  def self.new_trip(origin, destination, user_key)
    if MapService.fetch_trip_duration(origin, destination)[:duration] == 'impossible'
      RoadTripDetails.new({start_city: origin, end_city: destination, travel_time: 'impossible'}, '')
    else
      details = MapService.fetch_trip_duration(origin, destination)
      user = User.find_by(api_key: user_key)
      duration = details[:duration]
      weather = WeatherService.future_forecast(details[:end_lat_lng][:lat], details[:end_lat_lng][:lng], duration)
      trip = RoadTrip.create(start_city: origin, end_city: destination, travel_time: duration, user: user)
      RoadTripDetails.new(trip, weather)
    end
  end

  private

  def self.impossible_trip(start_city, end_city)
    RoadTripDetails.new({start_city: start_city, end_city: end_city, travel_time: 'impossible'}, '')
  end
end