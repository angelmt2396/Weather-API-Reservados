class WeatherApiController < ApplicationController
  require 'json'
  require 'concurrent'

  def index
    begin
      filter = params[:city]
    cities = ReservamosCitiesService.getCities(filter)
    cityWeather = []
    threads = cities.map do |city|
      Thread.new do
        lat = city[:lat]
        lon = city[:lon]
        puts "lat: #{lat}, lon: #{lon}"
        weather = OpenWeatherApiService.get(lat, lon)
        cityWeather.push({
          id: city[:id],
          city: city[:city_name],
          weather_forecast: weather
        })
      end
    end
    threads.each(&:join)
    render json: cityWeather
    rescue StandardError => e
      puts "Error: #{e.message}"
      render json: { error: "An error occurred: #{e.message}" }, status: :internal_server_error
    end
  end
end
