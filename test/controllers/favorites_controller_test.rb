require 'test_helper'

class FavoritesControllerTest < ActionDispatch::IntegrationTest
  test "should get add" do
    get favorites_add_url
    assert_response :success
  end

  test "should get remove" do
    get favorites_remove_url
    assert_response :success
  end

end
