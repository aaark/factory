require 'test_helper'

class VehicleTypeControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get vehicle_type_new_url
    assert_response :success
  end

end
