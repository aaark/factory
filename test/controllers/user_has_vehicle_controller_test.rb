require 'test_helper'

class UserHasVehicleControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get user_has_vehicle_new_url
    assert_response :success
  end

end
