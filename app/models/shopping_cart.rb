class ShoppingCart < ApplicationRecord
  # has_many :products?

  # validates :products, uniqueness: true, presence: true

  # methods to help find the following information
    # Each item in the order with a quantity and line-item subtotal
    # A link to the item description page
    # Order total price
    # Date/time the order was placed
    # The current status of the order
end
