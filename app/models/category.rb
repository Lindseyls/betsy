class Category < ApplicationRecord
  has_and_belongs_to_many :products

  validates :name, presence: true

  def show_product
    @products = Product.all

    products = self.products

    product_list = []
    products.each do |item|
      product_list << item.name
    end
    return product_list
  end

end
