class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
  end

  def new
    @product = Product.find_by(id: params[:product_id])
    @review = Review.new(product: @product)
  end

  def create
    @product = Product.find_by(id: params[:product_id])
    @review = Review.new(review_params)
    @review.product = @product
    @review.save

    redirect_to product_path(@product)

  end

  private
  def review_params
    params.require(:review).permit(:rating, :comments)
  end

end
