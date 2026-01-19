require "test_helper"

class GoalsControllerTest < ActionDispatch::IntegrationTest
  test "should get goal page" do
    get goals_path
    assert_response :success
  end

  test "should create goal" do
    assert_difference("Goal.count") do
      post goals_path, params: {
        goal: { goal_content: "Hello, I'm a test!", goal_start: Date.current, goal_end: Date.current }
      }
    end

    assert_redirected_to goals_path
  end

  test "should not create goal without goal content" do
    assert_no_difference("Goal.count") do
      post goals_path, params: {
        goal: { goal_content: "", goal_start: Date.current, goal_end: Date.current }
      }
    end

    assert_response :unprocessable_entity
    assert_select "div#error_explanation li", /Goal content can't be blank/
  end

  test "should not create goal without a start date" do
    assert_no_difference("Goal.count") do
      post goals_path, params: {
        goal: { goal_content: "Hi, I'm still a test....", goal_start: nil, goal_end: Date.current }
      }
    end

    assert_response :unprocessable_entity
    assert_select "div#error_explanation li", /Goal start can't be blank/
  end

  test "can create goal with no end date" do
    assert_difference("Goal.count") do
      post goals_path, params: {
        goal: { goal_content: "Really? Still testing?", goal_start: Date.current, goal_end: nil }
      }
    end
  end

  test "goal content should not exceed 150 characters" do
    assert_no_difference("Goal.count") do
      post goals_path, params: {
        goal: { goal_content: "Test" * 151, goal_start: Date.current, goal_end: Date.current }
      }
    end

    assert_response :unprocessable_entity
    assert_select "div#error_explanation li", /Goal content is too long/
  end
end
