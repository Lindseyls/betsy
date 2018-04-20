class Review < ApplicationRecord
  belongs_to :product, counter_cache: :vote_count
  

  validates :product, presence: true

  validates :product, numericality: {only_integer: true, less_than_or_equal_to: 5}

end
