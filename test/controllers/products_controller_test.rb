require "test_helper"

describe ProductsController do
  describe "index" do
    it "succeeds when there are products" do
      # Arrange
      Product.count.must_be :>, 0
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
    it 'can add a valid product' do
      # Arrange
      product_data = {
        id: Product.first.id,
        name: 'TestToy',
        stock: 5,
        price: 500,
        description: "A dogs dream",
        pet_type: "dog",
        photo_url: "Pickles.jpg",
        # user_id: 5
      }
      old_product_count = Product.count

      # Assumptions
      Product.new(product_data).must_be :valid?

      # Act
      post products_path, params: { product: product_data }

      # Assert
      must_respond_with :redirect
      must_redirect_to products_path

      Product.count.must_equal old_product_count + 1
      Product.last.name.must_equal product_data[:name]
    end
  end

  describe "show" do
    it 'sends success if the product exists' do
      get product_path(Product.first)
      must_respond_with :success
    end

    it "sends not_found if the product doesn't exist" do
      product_id = Product.last.id + 1

      get product_path(product_id)

      must_respond_with :not_found
    end
  end


end
