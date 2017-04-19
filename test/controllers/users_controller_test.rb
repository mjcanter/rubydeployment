require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get dash" do
    get users_dash_url
    assert_response :success
  end

end
