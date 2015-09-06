class ProductsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create]
  before_action :admin_user, only: [:new, :create]

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:succcess] = "Buku berhasil di simpan"
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

    def product_params
      params.require(:product).permit(:title, :author, :description, :image_url,
                                      :price)
    end

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
