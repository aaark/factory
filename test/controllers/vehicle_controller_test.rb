require 'test_helper'

class VehicleControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get vehicle_new_url
    assert_response :success
  end

end
