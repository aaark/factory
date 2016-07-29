require 'test_helper'

class UserVehiclesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get user_vehicles_new_url
    assert_response :success
  end

end
