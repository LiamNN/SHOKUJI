require "test_helper"

class UserGoalControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get user_goal_new_url
    assert_response :success
  end

  test "should get create" do
    get user_goal_create_url
    assert_response :success
  end
end
