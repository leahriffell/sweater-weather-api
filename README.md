## API Endpoints
- This API is available at `https://sweater-weather-lriff.herokuapp.com/`
- Responses are sent as JSON

### Get Forecast
#### Returns the forecast for a given location
- Returns the current weather, daily forecast for the next 5 days, and the hourly forecast for the next 8 hours
- Required arguments:
  - location: city and state (ex: 'New York, NY')
- Example request: GET `https://sweater-weather-lriff.herokuapp.com/api/v1/forecast?location=denver,co`
- Example response: 
  ```
  {:data=>
  {:id=>nil,
   :type=>"forecast",
   :attributes=>
    {:current_weather=>
      {:datetime=>"2020-11-08T20:25:08.000-07:00",
       :sunrise=>"2020-11-08T05:22:11.000-07:00",
       :sunset=>"2020-11-08T15:37:42.000-07:00",
       :temperature=>59.68,
       :feels_like=>56.53,
       :humidity=>76,
       :uvi=>2.96,
       :visibility=>10000,
       :conditions=>"clear sky",
       :icon=>"01n"},
     :daily_weather=>
      [{:date=>"2020-11-09",
        :sunrise=>"2020-11-09T05:23:19.000-07:00",
        :sunset=>"2020-11-09T15:36:46.000-07:00",
        :max_temp=>72.66,
        :min_temp=>56.64,
        :conditions=>"light rain",
        :icon=>"10d"},
       {:date=>"2020-11-10",
        :sunrise=>"2020-11-10T05:24:27.000-07:00",
        :sunset=>"2020-11-10T15:35:52.000-07:00",
        :max_temp=>69.75,
        :min_temp=>56.57,
        :conditions=>"light rain",
        :icon=>"10d"},
       {:date=>"2020-11-11",
        :sunrise=>"2020-11-11T05:25:36.000-07:00",
        :sunset=>"2020-11-11T15:34:59.000-07:00",
        :max_temp=>54.3,
        :min_temp=>41.05,
        :conditions=>"light rain",
        :icon=>"10d"},
       {:date=>"2020-11-12",
        :sunrise=>"2020-11-12T05:26:44.000-07:00",
        :sunset=>"2020-11-12T15:34:08.000-07:00",
        :max_temp=>52.84,
        :min_temp=>36.48,
        :conditions=>"clear sky",
        :icon=>"01d"},
       {:date=>"2020-11-13",
        :sunrise=>"2020-11-13T05:27:52.000-07:00",
        :sunset=>"2020-11-13T15:33:19.000-07:00",
        :max_temp=>55.11,
        :min_temp=>37.2,
        :conditions=>"clear sky",
        :icon=>"01d"}],
     :hourly_weather=>
      [{:time=>"21:00:00", :temperature=>59.18, :wind_speed=>"6.29 mph", :wind_direction=>"from SE", :conditions=>"clear sky", :icon=>"01n"},
       {:time=>"22:00:00", :temperature=>58.26, :wind_speed=>"6.35 mph", :wind_direction=>"from SE", :conditions=>"clear sky", :icon=>"01n"},
       {:time=>"23:00:00", :temperature=>57.63, :wind_speed=>"6.64 mph", :wind_direction=>"from SE", :conditions=>"clear sky", :icon=>"01n"},
       {:time=>"00:00:00", :temperature=>57.02, :wind_speed=>"5.68 mph", :wind_direction=>"from SE", :conditions=>"clear sky", :icon=>"01n"},
       {:time=>"01:00:00", :temperature=>56.62, :wind_speed=>"5.14 mph", :wind_direction=>"from SE", :conditions=>"clear sky", :icon=>"01n"},
       {:time=>"02:00:00", :temperature=>56.5, :wind_speed=>"5.06 mph", :wind_direction=>"from SE", :conditions=>"clear sky", :icon=>"01n"},
       {:time=>"03:00:00", :temperature=>56.39, :wind_speed=>"4.85 mph", :wind_direction=>"from SE", :conditions=>"clear sky", :icon=>"01n"},
       {:time=>"04:00:00", :temperature=>56.35, :wind_speed=>"4.76 mph", :wind_direction=>"from SE", :conditions=>"clear sky", :icon=>"01n"}]}}}
  ```
- Definition of Attributes 
  | Attribute     | Definition
  | ------------- |:-------------:|
  | datetime      | insert        |
  | sunrise       | insert        |
  | sunset        | insert        |
  | temperature   | insert        |
  | feels_like    | insert        |
  | humidity      | insert        |
  | uvi           | insert        |
  | visibility    | insert        |
  | conditions    | insert        |
  | icon          | insert        |
  | date          | insert        |
  | max_temp      | insert        |
  | min_temp      | insert        |
  | time          | insert        |
  | wind_speed    | insert        |
  | wind_direction| insert        |

### Get Location Background Image
#### Returns a background image for a given location
- Requirements for use:
  - [properly provide attribution for the photographer and Unsplash](https://help.unsplash.com/en/articles/2511315-guideline-attribution)
- Required arguments:
  - location: location (ex: 'New York, NY')
- Example request: GET `https://sweater-weather-lriff.herokuapp.com/api/v1/backgrounds?location=new%20york,%20new%20york`
- Example response: 
  ```
  {
    "data": {
      "id": null,
      "type": "image",
      "attributes": {
        "description": null,
        "url": "https://images.unsplash.com/photo-1553484604-9f524520c793?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjE4MTA0N30",
        "credits": {
          "artist_username": "capdfrawy",
            "artist_name": "CapDfrawy",
            "profile_url": "https://unsplash.com/@capdfrawy"
        }
      }
    }
  }
  ```
  - Definition of Attributes 
  | Attribute      | Definition
  | -------------  |:-------------:|
  | description    | insert        |
  | url            | insert        |
  | artist_username| insert        |
  | artist_name    | insert        |
  | profile_url    | insert        |
