require 'test_helper'

class SecretsControllerTest < ActionDispatch::IntegrationTest
  test "should get secrets" do
    get secrets_secrets_url
    assert_response :success
  end

end
