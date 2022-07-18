require "test_helper"

class Admin::ParkingControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_parking_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_parking_show_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_parking_destroy_url
    assert_response :success
  end
end
