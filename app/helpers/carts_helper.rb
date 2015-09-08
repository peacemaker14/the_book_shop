module CartsHelper
  def current_cart
    if (cart_id = session[:cart_id])
      @current_cart ||= Cart.find_by(id: cart_id)
    end
  end
end
