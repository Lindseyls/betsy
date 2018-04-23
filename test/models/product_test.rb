require "test_helper"

describe Product do
  let(:product) { Product.new }
  let(:valid_product) {products(:valid_product)}
  let(:one) {products(:one)}
  let(:two) {users(:two)}

  describe 'relations' do
    it "must belong to a user" do
      valid_product.valid?.must_equal false
      valid_product.errors.keys.must_include :user
    end

  end
  describe 'validations' do
    it "must have a name to be valid" do
      one.valid?.must_equal true
      one.name = ""
      one.valid?.must_equal false
    end

    it "must have a unique name" do
      product = products(:two)
      product.name = products(:one).name
      product.valid?.must_equal false
    end

  end


end
