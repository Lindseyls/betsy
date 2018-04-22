class Product < ApplicationRecord
  validates :name, presence: true

  has_many :order_items
  has_many :categories
  has_many :reviews, dependent: :destroy
  belongs_to :users, optional: true
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

end
