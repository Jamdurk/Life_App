require "test_helper"

class DailyEntriesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_path
    assert_response :success
  end

  test "should create daily entry" do
    assert_difference("DailyEntry.count") do
      post daily_entries_path, params: { daily_entry: { day_content: "Test day content", mood: 1 } }
    end

    assert_redirected_to root_path
  end

  test "should not create daily entry without day content" do
    assert_no_difference("DailyEntry.count") do
      post daily_entries_path, params: { daily_entry: { day_content: "", mood: 1 } }
    end

    assert_response :unprocessable_entity
    assert_select "div#error_explanation li", /Day content can't be blank/
  end

  test "should not create daily entry without a mood" do
    assert_no_difference("DailyEntry.count") do
      post daily_entries_path, params: { daily_entry: { day_content: "Hi", mood: nil } }
    end

    assert_response :unprocessable_entity
    assert_select "div#error_explanation li", /Mood can't be blank/
  end

  test "should not create daily entry if mood exceeds 3" do
    assert_no_difference("DailyEntry.count") do
      post daily_entries_path, params: { daily_entry: { day_content: "This is a test", mood: 4 } }
    end

    assert_response :unprocessable_entity
    assert_select "div#error_explanation li", /Mood is not included in the list/
  end
end
