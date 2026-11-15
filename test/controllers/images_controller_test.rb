require "test_helper"

class ImagesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "recent uploads page renders" do
    get images_url
    assert_response :success
    assert_select "h2", "Recent Uploads"
  end

  test "upload page renders" do
    get upload_url
    assert_response :success
    assert_select "h2", "Upload"
  end

  test "image show renders when no file is attached" do
    get image_url(images(:one))
    assert_response :success
    assert_match "One User", response.body
  end

  test "signed in user can upload an image" do
    sign_in users(:one)

    assert_difference -> { Image.count }, 1 do
      post images_url, params: {
        image: {
          description: "A pixel",
          image: fixture_file_upload("pixel.png", "image/png")
        }
      }
    end

    image = Image.order(:id).last
    assert_redirected_to image
    follow_redirect!
    assert_response :success
    assert image.image.attached?
  end
end
