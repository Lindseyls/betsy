class ProductsController < ApplicationController
  # nic used
  # route controller view
  def index
    if params[:user_id]
      @user = User.find(params[:users_id])
      @products = @user.products
      # finds the products for specific user
    else
      @products = Product.all
    end
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
  end

  def show
    @product = Product.find_by(id: params[:id])
  end
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
    params.require(:product).permit(:name, :stock, :price, :description, :pet_type, :photo_url)
  end
end
