require "test_helper"

describe ReviewsController do
  describe "index" do
    it "sends a success response when there are many reviews'" do

      Review.count.must_be :>, 0
      product = Product.first

      # Act
      get product_reviews_path(product.id)

      # Assert
      must_respond_with :success
    end
  end

  # describe "create" do
  #   it "creates a review with valid data for a real category" do
  #     # Arrange
  #     product = Product.first
  #     product_data = product.attributes
  #
  #     review_data = {
  #       rating: 3,
  #       comments: 'controller test comment',
  #       product: product_data
  #     }
  #     review = Review.new(review_data)
  #     old_review_count = Review.count
  #
  #     # Assumption
  #     review.must_be :valid?
      #
      # Act
      # post product_reviews_path, params: { product: product_data }
      #
      # # Assert
      # Review.count.must_equal old_work_count + 1
      # Review.last.product.must_equal review_data[:product]
  #   end
  # end
end
