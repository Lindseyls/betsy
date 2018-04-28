class ReviewsController < ApplicationController

  def new
    @product = Product.find_by(id: params[:product_id])
    if current_user && @user.id == @product.user.id
      flash[:status] = :failure
      flash[:result_text] = "You can't review your own product"
      redirect_to product_path(@product.id)
    else
      render_404 unless @product
      @review = Review.new(product: @product)
  end

  def create
    @product = Product.find_by(id: params[:product_id])
    if current_user && @user.id == @product.user.id
      flash[:status] = :failure
      flash[:result_text] = "You can't review your own product"
      redirect_to product_path(@product.id)
    else
      @review = Review.new(review_params)
      @review.product = @product

      if @review.save
        flash[:status] = :success
        flash[:result_text] = "Successfully created review"
        redirect_to product_path(@product)
      else
        flash[:status] = :failure
        flash[:result_text] = "Could not create review"
        flash[:messages] = @review.errors.messages
        render :new, status: :bad_request
      end
    end
  end

  private
  def review_params
    params.require(:review).permit(:rating, :comments)
  end

end
