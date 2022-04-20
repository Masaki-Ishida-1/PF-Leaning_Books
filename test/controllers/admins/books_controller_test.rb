require "test_helper"

class Admins::BooksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_books_index_url
    assert_response :success
  end

  test "should get destroy" do
    get admins_books_destroy_url
    assert_response :success
  end
end
