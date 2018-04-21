require "test_helper"

describe ProductsController do
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

end
