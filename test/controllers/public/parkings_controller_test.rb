require "test_helper"

class Public::ParkingsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_parkings_new_url
    assert_response :success
  end

  test "should get index" do
    get public_parkings_index_url
    assert_response :success
  end

  test "should get show" do
    get public_parkings_show_url
    assert_response :success
  end

  test "should get destroy" do
    get public_parkings_destroy_url
    assert_response :success
  end
end
