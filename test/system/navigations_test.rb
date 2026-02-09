
require "application_system_test_case"

class NavigationTest < ApplicationSystemTestCase
  test "navbar links appear on every page" do 
    visit root_path
  
    assert_selector "a[href='#{hobbies_path}']"
    assert_selector "a[href='#{goals_path}']"
    assert_selector "a[href='#{root_path}']"

    visit hobbies_path

    assert_selector "a[href='#{hobbies_path}']"
    assert_selector "a[href='#{goals_path}']"
    assert_selector "a[href='#{root_path}']"

    visit goals_path

    assert_selector "a[href='#{hobbies_path}']"
    assert_selector "a[href='#{goals_path}']"
    assert_selector "a[href='#{root_path}']"
  end

  test "navbar links navigate to correct pages" do
    visit root_path
    
    click_on "Hobbies"
    assert_current_path hobbies_path
    
    click_on "Goals"
    assert_current_path goals_path
    
    click_on "Daily Entry"
    assert_current_path root_path
  end 
end