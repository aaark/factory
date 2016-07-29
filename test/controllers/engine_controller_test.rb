require 'test_helper'

class EngineControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get engine_new_url
    assert_response :success
  end

end
