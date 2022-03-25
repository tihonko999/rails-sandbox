require 'test_helper'

# TODO can not understand how scope works in tests
class CategoryTest < ActiveSupport::TestCase
  def setup
    @category = Category.new(name: "Sports")
  end

  test "category should be valid" do
    assert @category.valid?
  end

  test "name should be present" do
    @category.name = " "
    assert_not @category.valid?
  end

  test "name should be unique" do
    @category.save
    @category2 = Category.new(name: @category.name)
    assert_not @category2.valid?
  end

  test "name should not be to long" do
    @category.name = "a" * 26
    assert_not @category.valid?
  end

  test "name should not be to short" do
    @category.name = "a"
    assert_not @category.valid?
  end
end