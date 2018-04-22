class Product < ApplicationRecord
  # validates :name, presence: true

  has_many :order_items
  has_many :categories
  has_many :reviews, dependent: :destroy
  belongs_to :users, optional: true
  has_and_belongs_to_many :categories

  # CATEGORIES = %w(Home Bedding Health Grooming Toys Training Accessories Food)

  def self.pet_type(type)
    where(pet_type: type).limit(4)
  end

  def self.cat
    pet_type("cat")
  end

  def self.dog
    pet_type("dog")
  end

  def self.reptile
    pet_type("reptile")
  end
end
