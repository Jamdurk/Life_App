require "test_helper"

class GoalsControllerTest < ActionDispatch::IntegrationTest

  test "should get goal page" do
    get goals_path
    assert_response :success
  end

  test "should create goal" do
    assert_difference("Goal.count") do
      post goals_path, params: { goal: { goal_content: "Hello, im a test!", goal_start: Date.current, goal_end: Date.current } }
    end
    assert_redirected_to goals_path
  end

  test "should not create goal without goal content" do
    assert_no_difference("Goal.count") do
      post goals_path, params: { goal: { goal_content: "",  goal_start: Date.current, goal_end: Date.current } }
      assert_select "div#error_explanation",  "The form contains 1 error • Goal content can't be blank"
    end
  end

  test "should not create goal without a start date" do
    assert_no_difference("Goal.count") do
      post goals_path, params: { goal: { goal_content: "Hi im still a test....",  goal_start: nil, goal_end: Date.current } }
      assert_select "div#error_explanation",  "The form contains 1 error • Goal start can't be blank"
    end
  end

  test "can create goal with no end date" do
    assert_difference("Goal.count") do
      post goals_path, params: { goal: { goal_content: "Really? Still testing?", goal_start: Date.current, goal_end: nil } }
    end
  end


end
