class OpenWeatherApiService
  require 'dotenv/load'
  require 'net/http'
  require 'uri'
  def self.get(lat, lon)
    lat = Float(lat)
    lon = Float(lon)
    uri_open_weather_map = 'https://api.openweathermap.org/data/2.5/onecall'
    api_key = ENV['API_KEY']
    puts api_key
    uri = URI.parse("#{uri_open_weather_map}?lat=#{lat}&lon=#{lon}&appid=#{api_key}")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(uri.path + '?' + uri.query)
    response = http.request(request)
    if response.is_a?(Net::HTTPSuccess)
      result = JSON.parse(response.body)
      days = result['daily']
      data = []
      days.each do |day|
        temp = day['temp']
        data.push({
          dt: Time.at(day['dt']),
          tem_max: temp['max'],
          tem_min: temp['min'],
        })
      end
      return data
    else
      puts "Error: #{response.code} - #{response.message}"
      raise "Error: #{response.code} - #{response.message}"
    end
  end
end
