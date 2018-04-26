class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :edit, :update, :destroy]


  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @products = @user.products
      # finds the products for specific user
    else
      @products = Product.all
    end
  end

  def new
    @product = Product.new(user_id: params[:user_id])
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      flash[:success] = "Product added successfully"
      redirect_to products_path
    else
      flash.now[:failure] = "Validations Failed"
      render :new, status: :bad_request
    end

  end

  def show
    @product = Product.find_by(id: params[:id])
    @review = Review.new(product: @product)
    @order_item = OrderItem.new(product: @product, quantity: 1)
  end

  def edit

  end

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

  private

  def product_params
    params.require(:product).permit(:name, :stock, :price, :description, :pet_type, :photo_url, :user_id, category_ids: [])
  end

  def find_product
    @product = Product.find_by(id: params[:id])
    head :not_found unless @product
  end
end
