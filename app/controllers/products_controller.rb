class ProductsController < ApplicationController
  # nic used
  # route controller view
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

<<<<<<< HEAD
=======
# def root
# are we making this the homepage?
#
# end

# def index
# @products = Product.all
# end

# def new
# @product = Product.new
#
# end
#
# def create
#
# end
#
# def show
# @product = Product.find_by(id? name?: params[:])
#
# end
#
# def edit
#
# end
#
# def update
# @product.update_attributes(product_params)
# @product.save
# end
#
# def destroy
# @product.destroy
# redirect_to root_path
#
# end

# private

# def product_params
# params.require(:product).permit(:name, :stock, :price, :description)
# end
>>>>>>> 5d9ec9db6222061f07e8c2237f898a8598fe3003
end
