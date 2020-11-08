class HourlyForecast
  attr_reader :time,
              :temperature,
              :wind_speed,
              :wind_direction,
              :conditions,
              :icon

  def initialize(details)
    @time = convert_to_time(details[:dt])
    @temperature = details[:temp]
    @wind_speed = details[:wind_speed].to_s
    @wind_direction = convert_to_cardinal_directions(details[:wind_deg])
    @conditions = details[:weather][0][:description]
    @icon = details[:weather][0][:icon]
  end

  def convert_to_time(unix_timestamp)
    Time.at(unix_timestamp).strftime('%H:%M:%S')
  end

  def convert_to_cardinal_directions(degrees)
    case degrees
    when 348.75..33.75
      'N'
    when 33.75..87.75
      'NE'
    when 78.75..123.75
      'E'
    when 123.75..168.75
      'SE'
    when 168.75..213.75
      'S'
    when 213.75..258.75
      'SW'
    when 258.75..303.75
      'W'
    when 303.75..348.75
      'NW'
    end
  end
end
