class TrailsFacade
  def self.nearby_trails(start_location)
    latlng = MapService.forward_geocode(start_location)
    trails = TrailsService.search_nearby_trails(latlng[:lat], latlng[:lng])
    trails[:trails].map do |trail|
      Trail.new(trail, latlng)
    end
  end
end