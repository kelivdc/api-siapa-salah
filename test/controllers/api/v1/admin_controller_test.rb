require "test_helper"

class Api::V1::AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get api_v1_admin_login_url
    assert_response :success
  end
end
