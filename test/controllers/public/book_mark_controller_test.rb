require "test_helper"

class Public::BookMarkControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get public_book_mark_create_url
    assert_response :success
  end

  test "should get destroy" do
    get public_book_mark_destroy_url
    assert_response :success
  end
end
