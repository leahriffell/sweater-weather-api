class MapService
  def self.forward_geocode(city_state)
    response = conn.get("/geocoding/v1/address?") do |request|
      request.params['key'] = ENV['MAP_API_KEY']
      request.params['location'] = city_state.delete(" ")
    end
    parsed = parse(response)
    parse_lat_lng(parsed)
  end

  def self.fetch_trip_duration(start_location, end_location)
    response = conn.get("directions/v2/route?") do |request|
      request.params['key'] = ENV['MAP_API_KEY']
      request.params['from'] = start_location
      request.params['to'] = end_location
    end
    parsed = parse(response)
    { duration: trip_duration(parsed), end_lat_lng: end_coordinates(parsed) }
  end

  private
  
  def self.conn
    Faraday.new(url: 'http://www.mapquestapi.com')
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.trip_duration(response)
    if response[:info][:statuscode] == 500 || response[:info][:statuscode] == 402
      'impossible'
    else
      response[:route][:formattedTime]
    end
  end

  def self.end_coordinates(response)
    if !response[:route] || !response[:route][:locations]
      nil
    else
      response[:route][:locations][1][:latLng]
    end
  end

  def self.parse_lat_lng(response)
    if response[:results][0][:locations].empty?
      {lat: 'no match', lng: 'no match'}
    else
      response[:results][0][:locations][0][:latLng]
    end
  end
end
