class Product < ApplicationRecord
  # validates :name, presence: true

  has_many :order_items
  has_many :categories
  has_many :reviews, dependent: :destroy
  belongs_to :users, optional: true
  has_and_belongs_to_many :categories

  # CATEGORIES = "home & bedding","health & grooming", "toys", "training & accessories", "food"

end
