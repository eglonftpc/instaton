require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "should get home" do
    get root_url
    assert_response :success
    assert_select "h1", "Instaton"
  end

  test "log out submits a delete form" do
    sign_in users(:one)
    get root_url
    assert_response :success
    assert_select "form[action='#{destroy_user_session_path}']" do
      assert_select "input[name=_method][value=delete]"
      assert_select "button", "Log Out"
    end
  end
end
