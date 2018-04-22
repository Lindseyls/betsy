require "test_helper"

describe Category do
  describe "relations" do
    it "connects product and product_id" do
      # Arrange
      # author = Author.create!
      # once we create the seed data in fixture
      # we write this
      @product = Product.first
      categories = Category.new(name: 'test category')

      # Act
      @product.categories << categories

      # Assert
      @product.categories.must_equal category_ids
    end
  end

  describe "validations" do

  end
end
