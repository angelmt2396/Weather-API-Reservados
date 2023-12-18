class ReservamosCitiesService
  require 'net/http'
  require 'uri'
  def self.getCities(city)
    reservamos_uri = 'https://search.reservamos.mx/api/v2/places'
    uri = URI.parse("#{reservamos_uri}?q=#{city}")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(uri.path + '?' + uri.query)
    response = http.request(request)
    if response.is_a?(Net::HTTPSuccess)
      result = JSON.parse(response.body)
      cities = []
      result.each do |data|
        if data['result_type'] == 'city'
          cities.push({
            id: data['id'],
            lat: data['lat'],
            lon: data['long'],
            city_name: data['city_name'],
            country: data['country']
          })
        end
      end
      return cities
    else
      puts "Error: #{response.code} - #{response.message}"
      return {
        message: response.message,
        code: response.code
      }
    end
  end
end
