require "test_helper"

describe Category do
  describe "relations" do
    it "connects product and product_id" do
      product = Product.first
      category = Category.first

      product.categories << category

      product.category_ids.must_include category.id
    end
  end

  describe "validations" do

  end
end
