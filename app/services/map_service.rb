class MapService
  def self.forward_geocode(city_state)
    response = conn.get('/geocoding/v1/address?') do |request|
      request.params['key'] = ENV['MAP_API_KEY']
      request.params['location'] = city_state.delete(" ")
    end
    parsed = parse(response)
    parsed[:results][0][:locations][0][:latLng]
  end

  def self.distance_between(start_lat, start_lon, end_lat, end_lon)
    # response = conn.get('/directions/v2/route?') do |request|
    #   request.params['key'] = ENV['MAP_API_KEY']
    #   request.params['from'] = {latLng:{lat:start_lat,lng:start_lon}}
    #   request.params['to'] =  {latLng:{lat:end_lat,lng:end_lon}}
    # end
    response = conn.get("/directions/v2/route?key=#{ENV['MAP_API_KEY']}&from={latLng:{lat:#{start_lat},lng:#{start_lon}}}&to={latLng:{lat:#{end_lat},lng:#{end_lon}}}")
    parsed = parse(response)
    parsed[:route][:distance]
  end

  private
  
  def self.conn
    Faraday.new(url: 'http://www.mapquestapi.com')
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end