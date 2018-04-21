require "test_helper"

describe Review do
  describe "relations" do
    it "has a product" do
      r = reviews(:one)
      r.must_respond_to :product
      r.product.must_be_kind_of Product
    end
  end

  describe "validations" do
    it "allows users to review for multiple products" do
      review1 = reviews(:one)
      review2 = reviews(:two)
      review1.valid?.must_equal true
      review2.valid?.must_equal true
    end

    it "requires a rating" do
      review = Review.new(comments: "great product")
      review.valid?.must_equal false
      review.errors.messages.must_include :rating
    end


    it "requires a rating to be integer" do
      review = Review.new(rating: "what")
      review.valid?.must_equal false
      review.errors.messages.must_include :rating
    end
  end
end
