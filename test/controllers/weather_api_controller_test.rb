require "test_helper"

class WeatherApiControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get weather_api_index_url
    assert_response :success
  end
end
