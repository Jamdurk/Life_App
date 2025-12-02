require "test_helper"

class HobbyTest < ActiveSupport::TestCase
  setup do 
    @hobby = hobbies(:one)
  end

  test "hobby is valid with valid attributes" do
    assert @hobby.valid?
  end

  test "hobby is valid without an end date" do
    @hobby.end_date = nil 
    assert @hobby.valid?
  end

  test "hobby is not valid without a start date" do
    @hobby.start_date = nil 
    assert_not @hobby.valid?
    assert_includes @hobby.errors[:start_date], "can't be blank"
  end

  test "hobby is not valid without content" do
    @hobby.hobby_content = nil 
    assert_not @hobby.valid?
    assert_includes @hobby.errors[:hobby_content], "can't be blank"
  end

  test "hobby is not valid with content over 150 characters" do
    @hobby.hobby_content = "a" * 151
    assert_not @hobby.valid?
    assert_includes @hobby.errors[:hobby_content], "is too long (maximum is 150 characters)"
  end
end
