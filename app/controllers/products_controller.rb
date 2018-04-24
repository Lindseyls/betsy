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
    @review = Review.find_by(id: params[:review_id])
    @product = Product.new(user_id: params[:user_id], review: @review)
  end

  def create
    @review = Review.find_by(id: params[:review_id])
    @product = Product.new(product_params)
    @product.review = @review

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
    params.require(:product).permit(:name, :stock, :price, :description, :pet_type, :photo_url, :user_id, categories_ids: [])
  end

  def find_product
    @product = Product.find_by(id: params[:id])
    # head is like render, but doesn't run a view template, only status code
    head :not_found unless @product
  end
end
