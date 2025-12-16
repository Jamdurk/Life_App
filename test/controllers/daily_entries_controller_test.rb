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
    assert_redirected_to daily_entries_path
  end

  test "should not create daily entry without day content" do
    assert_no_difference("DailyEntry.count") do
      post daily_entries_path, params: { daily_entry: { day_content: "",  mood: 1} }
      assert_select "div#error_explanation",  "The form contains 1 error • Day content can't be blank"
    end
  end

  test "should not create daily entry without a mood" do
    assert_no_difference("DailyEntry.count") do
      post daily_entries_path, params: { daily_entry: { day_content: "Hi",  mood: nil } }
      assert_select "div#error_explanation",  "The form contains 1 error • Mood can't be blank"
    end
  end
    

end
