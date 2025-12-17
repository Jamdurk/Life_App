require "test_helper"

class HobbiesControllerTest < ActionDispatch::IntegrationTest

  test "should get hobby page" do
    get hobbies_path
    assert_response :success
  end

  test "should create hobby with valid information" do
    assert_difference("Hobby.count") do
      post hobbies_path, params: { hobby: { hobby_content: "Hello, im a test!", start_date: Date.current, end_date: Date.current } }
    end
    assert_redirected_to hobbies_path
  end

  test "should not create hobby with no hobby content" do
    assert_no_difference("Hobby.count") do
      post hobbies_path, params: { hobby: { hobby_content: "", start_date: Date.current, end_date: Date.current } }
      assert_select "div#error_explanation",  "The form contains 1 error • Hobby content can't be blank"
    end
  end

  test "should not create hobby with no start date" do
    assert_no_difference("Hobby.count") do
      post hobbies_path, params: { hobby: { hobby_content: "Hi im a test", start_date: nil, end_date: Date.current } }
      assert_select "div#error_explanation",  "The form contains 1 error • Start date can't be blank"
    end
  end

  test "shouuld be able to create hobby with content and a start date but no end date" do
    assert_difference("Hobby.count") do
      post hobbies_path, params: { hobby: { hobby_content: "Hi im a test", start_date: Date.current, end_date: nil } }
    end
  end
 
end
