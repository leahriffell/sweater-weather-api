# Sweater Weather
![rails-badge](https://img.shields.io/badge/Rails-5.2.4-informational?style=flat-square) ![ruby-badge](https://img.shields.io/badge/Ruby-2.5.3-informational?style=flat-square) ![build-badge](https://img.shields.io/travis/leahriffell/sweater-weather-api/main?style=flat-square)

### API serving up endpoints for a roadtrip planning app
_trip duration, current and forecasted weather upon arrival, background image for a city, user creation and authentication_

## Readme Content
- [Setup](#setup)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
  - [Running a server](#run-your-own-development-server)
  - [Running the tests](#running-the-tests)
- [API Endpoints](#api-endpoints)
  - [Get Forecast](#get-forecast)
  - [Get Location Background Image](#get-location-background-image)
  - [User Management: Register New User](#user-management-register-new-user)
  - [User Management: Login User](#user-management-login-user)
  - [Create Roadtrip](#create-roadtrip)
- [Database Schema](#database-schema)
- [Organizational Design](#organizational-design)
- [Next Steps](#next-steps)
- [Author](#author)
_____

## Setup
### Prerequisites
- Ruby 2.5.3
- Rails 5.2.4.3

### Installation
#### Install gems and setup your database:
```
bundle install
rails db:create
rails db:migrate
```

#### Run your own development server:
```
rails s
```
- You should be able to send requests to the app via http://localhost:3000/
- This is only an API (no frontend view)
- You can also access the production API at [sweater-weather-lriff.herokuapp.com](https://sweater-weather-lriff.herokuapp.com/)

### Running the Tests
- Run with $ bundle exec rspec. All tests should be passing.


_____

## API Endpoints
- This API is available at `https://sweater-weather-lriff.herokuapp.com/`
- Responses are sent as JSON

### Get Forecast
#### Returns the forecast for a given location
- Returns the current weather, daily forecast for the next 5 days, and the hourly forecast for the next 8 hours
- Required parameters:
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
- Fields in Response 
  | Attribute     | Definition
  | ------------- |:-------------:|
  | datetime      | current date and time                                                                   |
  | sunrise       | date and time of sunrise                                                                |
  | sunset        | date and time of sunset                                                                 |
  | temperature   | temp in Fahrenheit                                                                      |   
  | feels_like    | temp in Fahrenheit                                                                      |
  | humidity      | humidity percentage                                                                     |
  | uvi           | midday UV index                                                                         |
  | visibility    | average visibility in meters                                                            |
  | conditions    | description of weather                                                                  |
  | icon          | [weather icon](https://openweathermap.org/weather-conditions#How-to-get-icon-URL)       |
  | date          | date at forecast                                                                        |
  | max_temp      | max daily temp                                                                          |
  | min_temp      | min daily temp                                                                          |
  | time          | time at forecast                                                                        |
  | wind_speed    | speed in mph                                                                            |
  | wind_direction| cardinal direction of wind                                                              |

_____

### Get Location Background Image
#### Returns a background image for a given location
- Requirements for use:
  - [properly provide attribution for the photographer and Unsplash](https://help.unsplash.com/en/articles/2511315-guideline-attribution)
- Required parameters:
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
- Fields in Response 

  | Attribute      | Definition
  | -------------  |:-------------:|
  | description    | artist provided description of photo   |
  | url            | link to photo                          |
  | artist_username| artist's Unsplash username             |
  | artist_name    | artist's first and last name           |
  | profile_url    | link to artist's Unsplash profile      |

_____

### User Management: Register New User
#### Register a new user and generate their API key
- Required arguments:
  - Send user information as JSON payload in body of the request
      - email
      - password
      - password confirmation

- Example request:
  ```
  POST https://sweater-weather-lriff.herokuapp.com/api/v1/users
  Content-Type: application/json
  Accept: application/json

  {
    'email': 'user@example.com',
    'password': 'password',
    'password_confirmation': 'password'
  }
  ```
- Example response: 
  ```
  {
      "data": {
          "id": "3",
          "type": "users",
          "attributes": {
              "email": "user@example.com",
              "api_key": "d4982803-cdb8-461a-a3f6-e4ce334eeaee"
          }
      }
  }
  ```
- Fields in Response 

  | Attribute      | Definition
  | -------------  |:-------------:|
  | email          | user's email               |
  | api_key        | user's unique api key      |

_____

### User Management: Login User
#### Login user and return their API key
- Required arguments:
  - Send user information as JSON payload in body of the request
      - email
      - password

- Example request:
  ```
  POST https://sweater-weather-lriff.herokuapp.com/api/v1/sessions
  Content-Type: application/json
  Accept: application/json

  {
    "email": "whatever@example.com",
    "password": "password"
  }
  ```
- Example response: 
  ```
  {
      "data": {
          "id": "3",
          "type": "users",
          "attributes": {
              "email": "user@example.com",
              "api_key": "d4982803-cdb8-461a-a3f6-e4ce334eeaee"
          }
      }
  }
  ```
- Definition of Attributes 

  | Attribute      | Definition
  | -------------  |:-------------:|
  | email          | user's email                 |
  | api_key        | user's unique api key        |

______

### Create Roadtrip
#### Posts a new roadtrip for a user and returns origin, destination, duration and weather info upon arrival
- Required arguments:
  - Send user information as JSON payload in body of the request
      - origin
      - destination
      - api_key

- Example request:
  ```
  POST https://sweater-weather-lriff.herokuapp.com/api/v1/road_trip
  Content-Type: application/json
  Accept: application/json

  {
    'origin': 'Denver, CO',
    'destination': 'Los Angeles, CA',
    'api_key': 'jgn983hy48thw9begh98h4539h4'
  }
  ```
- Example response: 
  ```
  {
    "data": {
      "id": null,
      "type": "roadtrip",
      "attributes": {
        "start_city": "Denver, CO",
        "end_city": "Los Angeles, CA",
        "travel_time": "14:30:48"
        "weather_at_eta": {
          "temperature": 63,
          "conditions": "winds light and variable"
        }
      }
    }
  }
  ```
- Fields in Response 

  | Attribute      | Definition
  | -------------  |:-------------:|
  | start_city     | origin location                                         |
  | end_city       | destination location                                    |
  | travel_time    | total time of estimated travel                          |
  | temperature    | forecasted temp in Fahrenheit at time of arrival        |
  | conditions     | description of forecasted weather at time of arrival    |

_____

## Database Schema
<img src="https://user-images.githubusercontent.com/34531014/98763358-1720ee00-2397-11eb-9239-1939088b0e88.png" width="700">

_____

## Organizational Design

- Implemented [facades](https://en.wikipedia.org/wiki/Facade_pattern) as the middle-layer between controllers and services
  - They send plain old Ruby objects (POROs) to the controller
- Utilized [services](https://en.wikipedia.org/wiki/Service_locator_pattern) as the middle-layer between facades and external API or database calls

##### Facades:
- Forecast
- Image
- Road Trip
- User

##### Services:
- Image (hits Unsplash API)
- Map (hits MapQuest API)
- Weather (hits OpenWeather API)

_____

## Next Steps
- Allow user to fetch weather at ETA even if trip duration is over 48 hours
  - The Open Weater API currently returns the hourly forecast for 48 hours but by also using the daily forecast this call provides, I could return forecasted weather at ETA for a trip up to 7 days
- Convert datetime fields to UTC to avoid timezone issues
- Implement caching for certain data points (latitude, longitude, etc.)
- Allow user to add parameters to endpoints to designate response in imperial vs. metric units
_____
## Author
- Leah Riffell | [github](https://github.com/leahriffell) | [linkedin](https://www.linkedin.com/in/leah-riffell/)
