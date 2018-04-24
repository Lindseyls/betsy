require "test_helper"

describe ReviewsController do
  describe 'new' do
    it 'responds with success' do
      product = Product.first
      get new_product_review_path(product)

      must_respond_with :success
    end
  end

  describe "create" do
    it "creates a review with valid data for a real category" do
      # Arrange
      product = Product.first

      review_data = {
        rating: 3,
        comments: 'controller test comment'
      }
      review = Review.new(review_data)
      old_review_count = Review.count

      # Assumption
      review.must_be :valid?

      # Act
      post product_reviews_path, params: { product: product }

      # Assert
      Review.count.must_equal old_work_count + 1
      Review.last.product.must_equal review_data[:product]
    end
  end
end
