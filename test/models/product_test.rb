require "test_helper"

describe Product do
  let(:product) { Product.new }
  let(:product1) {products(:product1)}
  let(:product2) {users(:product2)}

  describe 'relations' do
    it "must belong to a user" do
      product = products(:product1)
      product.must_respond_to :user
      product.must_be_kind_of Product
      product.user.must_be_kind_of User
    end

    it "must belong to a category" do
      product = products(:product1)
      product.must_respond_to :categories

    end

    it "has reviews" do
      product = products(:product1)
      product.must_respond_to :reviews
    end

  end
  describe 'validations' do
    it "must have a name to be valid" do
      product1.valid?.must_equal true
      product1.name = ""
      product1.valid?.must_equal false
    end

    it "must have a unique name" do
      product_name = "test productname"
      new_product = Product.new(name: product_name, price: 50, stock: 10)

      new_product.save!

      new_product2 = Product.new(name: product_name, price: 30, stock: 5)
      result = new_product2.save
      result.must_equal false
      new_product2.errors.messages.must_include :name
    end

    it "must have a price to be valid" do
      product1.valid?.must_equal true
      product1.price = ""
      product1.valid?.must_equal false
    end

    it "must have a price greater than 0" do
      product1.valid?.must_equal true
      product1.price = 0
      product1.valid?.must_equal false
      product1.price = -5
      product1.valid?.must_equal false
    end

    it "must have a stock to be valid" do
      product1.valid?.must_equal true
      product1.stock = ""
      product1.valid?.must_equal false
    end

    it "must have an integer as stock" do
      product1.valid?.must_equal true
      product1.stock = 0.4
      product1.valid?.must_equal false
    end

    it "must have as stock a number greater than or equal to 0" do
      product1.valid?.must_equal true
      product1.stock = 0
      product1.valid?.must_equal true
    end

    it "cannot have a negative number as stock" do
      product1.valid?.must_equal true
      product1.stock = -10
      product1.valid?.must_equal false
    end

  end

  describe 'custom methods' do

    it "returns correct average rating" do
      product = products(:product1)
      product.show_rating.must_equal 3

      product = products(:product2)
      product.show_rating.must_equal 4
    end


    it "returns an array of products" do
      product = products(:product1).pet_type

      Product.pet_type("reptile").must_be_kind_of Array
    end

  end


  end
