# RESERVAMOS API

* Ruby version
```
[ruby 3.2.2 (2023-03-30 revision e51014f9c0) [x64-mingw-ucrt]]
```
* Rails version
```
[Rails 7.1.2]
```

* System dependencies

* Configuration
```
* run the command: bundle install
* emviroment
  API_KEY
```
* Endpoint: GET /api/weather?city=mon
  - params: 
  ```
  city | (string): Partial or full name of a city
  ```
  - response (example):
```json
[
  {
    "id": 3253,
    "city": "Monroe",
    "weather_forecast": [
      {
        "dt": "2023-12-18T12:00:00.000-06:00",
        "tem_max": 289.31,
        "tem_min": 278.67
      },
      {
        "dt": "2023-12-19T12:00:00.000-06:00",
        "tem_max": 283.46,
        "tem_min": 274.78
      },
      {
        "dt": "2023-12-20T12:00:00.000-06:00",
        "tem_max": 287.93,
        "tem_min": 278.06
      },
      {
        "dt": "2023-12-21T12:00:00.000-06:00",
        "tem_max": 289.86,
        "tem_min": 279.26
      },
      {
        "dt": "2023-12-22T12:00:00.000-06:00",
        "tem_max": 290.54,
        "tem_min": 283.59
      },
      {
        "dt": "2023-12-23T12:00:00.000-06:00",
        "tem_max": 289.13,
        "tem_min": 288.09
      },
      {
        "dt": "2023-12-24T12:00:00.000-06:00",
        "tem_max": 291.06,
        "tem_min": 288.29
      },
      {
        "dt": "2023-12-25T12:00:00.000-06:00",
        "tem_max": 292.33,
        "tem_min": 288.42
      }
    ]
  }
]
```

* Services (job queues, cache servers, search engines, etc.)
```
- open_weather_api_service.rb
- reservamos_cities_service.rb
```
* Run (Local)
```
* run the command: rails server
```

* Collection 
  - [weatherApiReservamos.postman_collection.json](https://github.com/angelmt2396/Weather-API-Reservamos/blob/Weather-API/weatherApiReservamos.postman_collection.json)
* ...
