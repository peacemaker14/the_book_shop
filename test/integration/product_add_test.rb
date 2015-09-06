require 'test_helper'

class ProductAddTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:jonru)
  end

  test "invalid product information" do
    log_in_as(@user)
    get add_book_path
    assert_no_difference 'Product.count' do
      post products_path, product: { title: "",
                                     author: "",
                                     description: "",
                                     image_url: "",
                                     price: ""}
    end
    assert_template 'products/new'
  end
end
