require 'test_helper'

class ReviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get add" do
    get reviews_add_url
    assert_response :success
  end

  test "should get update" do
    get reviews_update_url
    assert_response :success
  end

  test "should get delete" do
    get reviews_delete_url
    assert_response :success
  end

end
