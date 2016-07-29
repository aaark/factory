require 'test_helper'

class UsersTypeControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get users_type_new_url
    assert_response :success
  end

end
