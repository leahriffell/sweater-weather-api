class Trail
  attr_reader :name, 
              :summary,
              :difficulty,
              :location,
              :distance_to_trail

  def initialize(details, start_coordinates)
    @name = details[:name]
    @summary = details[:summary]
    @difficulty = details[:difficulty]
    @location = details[:location]
    @distance_to_trail = calculate_distance_to_trail(start_coordinates, details[:latitude], details[:longitude])
  end

  def calculate_distance_to_trail(start_coordinates, end_lat, end_lon)
    MapService.distance_between(start_coordinates[:lat], start_coordinates[:lng], end_lat, end_lon)
  end
end