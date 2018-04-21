class Review < ApplicationRecord
  belongs_to :product, counter_cache: :review_count


  validates :rating, presence: true

  validates :rating, numericality: {only_integer: true, less_than_or_equal_to: 5}

end
