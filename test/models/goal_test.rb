require "test_helper"

class GoalTest < ActiveSupport::TestCase
  setup do 
    @goal = goals(:one)
  end

  test "goal is valid with valid attributes" do 
    assert @goal.valid?
  end

  test "goal is valid without a start date" do
    @goal.goal_start = nil
    assert @goal.valid?
  end

  test "goal is valid without an end date" do
    @goal.goal_end = nil
    assert @goal.valid?
  end

  test "goal is not valid without content" do
    @goal.goal_content = nil 
    assert_not @goal.valid?
    assert_includes @goal.errors[:goal_content], "can't be blank"
  end
end
