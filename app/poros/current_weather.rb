class CurrentWeather
  attr_reader :datetime,
              :sunrise,
              :sunset,
              :temperature,
              :feels_like,
              :humidity,
              :uvi,
              :visibility,
              :conditions,
              :icon

  def initialize(details)
    @datetime = convert_time(details[:dt])
    @sunrise = convert_time(details[:sunrise])
    @sunset = convert_time(details[:sunset])
    @temperature = details[:temp]
    @feels_like = details[:feels_like]
    @humidity = details[:humidity]
    @uvi = details[:uvi]
    @visibility = details[:visibility]
    @conditions = details[:weather][0][:description]
    @icon = details[:weather][0][:icon]
  end

  def convert_time(unix_timestamp)
    Time.at(unix_timestamp)
    # converts using local timezone
  end
end