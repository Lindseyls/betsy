class ProductsController < ApplicationController
  # nic used
  # route controller view

  def root
  end

  def index
    @product = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
  end

  # def show
  #   @product = Product.find_by(id? name?: params[:])
  #
  # end
  #
  # def edit
  #
  # end
  #
  # def update
  #   @product.update_attributes(product_params)
  #   @product.save
  # end
  #
  # def destroy
  #   @product.destroy
  #   redirect_to root_path
  #
  # end
  #
  private

  def product_params
    params.require(:product).permit(:name, :stock, :price, :description)
  end

end
