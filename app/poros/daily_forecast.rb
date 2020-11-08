class DailyForecast
  attr_reader :date,
              :sunrise,
              :sunset,
              :max_temp,
              :min_temp,
              :conditions,
              :icon

  def initialize(details)
    @date = convert_to_date(details[:dt])
    @sunrise = convert_time(details[:sunrise])
    @sunset = convert_time(details[:sunset])
    @max_temp = details[:temp][:max]
    @min_temp = details[:temp][:min]
    @conditions = details[:weather][0][:description]
    @icon = details[:weather][0][:icon]
  end

  def convert_to_date(unix_timestamp)
    Time.at(unix_timestamp).strftime('%Y-%m-%d')
  end

  def convert_time(unix_timestamp)
    Time.at(unix_timestamp)
    # converts using local timezone
  end
end