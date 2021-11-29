require "test_helper"

class ShoppingListsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get shopping_lists_create_url
    assert_response :success
  end

  test "should get new" do
    get shopping_lists_new_url
    assert_response :success
  end
end
