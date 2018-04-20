class Product < ApplicationRecord
  validates :name, presence: true

  has_many :orders
  has_many :categories
  has_many :reviews

  def self.by_description
    # Shoule have product types (create new column or just use description--misleading!)
    return Product.where(description: "accessory")
  end

end
