class ProductsController < ApplicationController

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
end
