require "test_helper"

describe ProductsController do
<<<<<<< HEAD
  describe "index" do
    it "succeeds when there are products" do
      # Arrange
      Product.all.count.must_be :>, 0
      # Act
      get products_path
      # Assert
      must_respond_with :success
    end

    it "succeeds when there are no products" do
      # Arrange
      Product.destroy_all
      Product.all.length.must_equal 0
      # Act
      get products_path
      # Assert
      must_respond_with :success
    end
  end

  describe "new" do
    it "succeeds" do
      # Arrange & Act
      get new_product_path
      # Assert
      must_respond_with :success
    end
  end

  describe "create" do
  end

=======
  # it "succeeds for valid products and existing product ID" do
  #   flunk "Need real tests"
  # end
>>>>>>> 5d9ec9db6222061f07e8c2237f898a8598fe3003
end
