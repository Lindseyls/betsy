class Product < ApplicationRecord

  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: {only_integer: true,  greater_than: 0}


  has_many :order_items
  has_many :reviews, dependent: :destroy
  belongs_to :user, optional: true
  has_and_belongs_to_many :categories

  def show_rating
    @reviews = Review.all

    total = 0
    reviews = @reviews.where(product_id: self.id)

    return "No reviews" if reviews.count == 0

    reviews.each do |review|
      total += review.rating
    end

    average = total/reviews.count
    return average
  end

    # def self.to_category_hash
    # data = {}
    # CATEGORIES.each do |cat|
    #   data[cat] = by_category(cat)
    # end
    # return data

  def by_pet_type
    # organize the products by their pet_type attribute
    pet_type = @products.where(pet_type: self.pet_type)

    data = {}
    pet_type.each do |type|
      data[type] = pet_type(type) #this pet_type refers to class method 
    end
    return data
  end

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
