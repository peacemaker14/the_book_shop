require 'test_helper'

class ProductAddTest < ActionDispatch::IntegrationTest

  test "invalid product information" do
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
