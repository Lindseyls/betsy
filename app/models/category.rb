class Category < ApplicationRecord
  has_and_belongs_to_many :products

  validates :name, presence: true

  def show_products

    products = self.products

    products.each do |item|
    item.name
    end
    return product_list
  end

end
