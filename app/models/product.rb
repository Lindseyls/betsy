class Product < ApplicationRecord
  validates :name, presence: true

  has_many :orders
  has_and_belongs_to_many :categories

  def self.by_description
    # Shoule have product types (create new column or just use description--misleading!)
    return Product.where(description: "accessory")
  end

end
