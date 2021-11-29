require "test_helper"

class MethodsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get methods_index_url
    assert_response :success
  end

  test "should get show" do
    get methods_show_url
    assert_response :success
  end
end
