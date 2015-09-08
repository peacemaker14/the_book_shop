class OrdersController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:new, :create]

  def new
    if @cart.line_items.empty?
      flash[:danger] = "Cart is empty!"
      redirect_to root_url
    elsif !logged_in?
      redirect_to login_path
    else
      @order = Order.new
    end
  end

  def show
    @user = User.find(params[:id])
    @order = @user.orders
  end

  def create
    @order = current_user.orders.new(order_params)
    @order.add_line_items_from_cart(@cart)
    if @order.save
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil
      redirect_to root_url
      flash[:success] = "Terima kasih telah berbelanja di sini"
    end
  end

  private

    def order_params
      params.require(:order).permit(:address, :pay_type)
    end
end
