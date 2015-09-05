require 'test_helper'

class ProductTest < ActiveSupport::TestCase

  def setup
    @product = Product.new(title: "Example Book", author: "John Roe",
                           description: "Lorem ipsum", image_url: "example.jpg",
                           price: 50000 )
  end

  test "should be valid" do
    assert @product.valid?
  end

  test "title should be present" do
    @product.title = "  "
    assert_not @product.valid?
  end

  test "author should be present" do
    @product.author = "  "
    assert_not @product.valid?
  end

  test "price should be present" do
    @product.price = nil
    assert_not @product.valid?
  end

  test "title should not be too long" do
    @product.title = "a" * 51
    assert_not @product.valid?
  end

  test "author should not be too long" do
    @product.author = "a" * 51
    assert_not @product.valid?
  end

  test "Description should not be too long" do
    @product.description = "a" * 501
    assert_not @product.valid?
  end

  test "Image cannot be empty" do
    @product.image_url = nil
    assert_not @product.valid?
  end
end
