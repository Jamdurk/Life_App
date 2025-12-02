require "test_helper"

class DailyEntryTest < ActiveSupport::TestCase
  setup do 
    @daily_entry = daily_entries(:one)
  end

  test "daily entry is valid with valid attributes" do
    assert @daily_entry.valid?
  end

  test "daily entry is not valid without a date" do
    @daily_entry.date = nil 
    assert_not @daily_entry.valid?
    assert_includes @daily_entry.errors[:date], "can't be blank"
  end

  test "daily entry is not valid without day content" do
    @daily_entry.day_content = nil 
    assert_not @daily_entry.valid?
    assert_includes @daily_entry.errors[:day_content], "can't be blank"
  end

  test "daily entry is not valid without mood" do
    @daily_entry.mood = nil 
    assert_not @daily_entry.valid?
    assert_includes @daily_entry.errors[:mood], "can't be blank"
  end
  
end
