class RoadTripFacade
  def self.new_trip(origin, destination, user_key)
    details = MapService.fetch_trip_duration(origin, destination)
    duration = details[:duration]
    weather = WeatherService.future_forecast(details[:end_lat_lng][:lat], details[:end_lat_lng][:lng], duration)
    user = User.find_by(api_key: user_key)
    trip = RoadTrip.create(start_city: origin, end_city: destination, travel_time: duration, user: user)
    RoadTripDetails.new(trip, weather)
  end
end