require "test_helper"

class RegistrationsControllerTest < ActionDispatch::IntegrationTest
  test "sign in and sign up pages render" do
    get new_user_session_url
    assert_response :success
    assert_select "h2", "Log in"

    get new_user_registration_url
    assert_response :success
    assert_select "h2", "Sign up"
  end

  test "user can sign up and sign out" do
    assert_difference -> { User.count }, 1 do
      post user_registration_url, params: {
        user: {
          email: "new@example.com",
          password: "password123",
          password_confirmation: "password123",
          username: "newuser",
          first_name: "New",
          last_name: "Person"
        }
      }
    end

    assert_redirected_to root_url
    follow_redirect!
    assert_response :success
    assert_select "button", "Log Out"

    delete destroy_user_session_url
    assert_redirected_to root_url
  end

  test "user can sign in with a fixture password" do
    post user_session_url, params: {
      user: { email: users(:one).email, password: "password123" }
    }

    assert_redirected_to root_url
  end
end
