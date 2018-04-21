class Product < ApplicationRecord
  validates :name, presence: true

  has_many :orders
  has_many :categories
  has_many :reviews
  has_and_belongs_to_many :categories

end
