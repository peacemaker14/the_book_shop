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

  test "Description should not be too long" do
    @product.description = "a" * 701
    assert_not @product.valid?
  end

  test "title must unique" do
    product_duplicate = @product.dup
    product_duplicate.title = @product.title.upcase
    @product.save
    assert_not product_duplicate.valid?
  end

  test "product price must be positive" do
    @product.price = -1
    assert_not @product.valid?
  end

  test "accept only valid image url" do
    valid_url = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg
             http://a.b.c/x/y/z/fred.gif }
    valid_url.each do |url|
      @product.image_url = url
      assert @product.valid?, "#{url.inspect} should be valid"
    end
  end

  test "rejects invalid image url" do
    invalid_url = %w{ fred.doc fred.gif/more fred.gif.more }
    invalid_url.each do |url|
      @product.image_url = url
      assert_not @product.valid?, "#{url.inspect} shouldn't be valid"
    end
  end
end
