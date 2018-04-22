class OrderItem < ApplicationRecord
  belongs_to :product
  belongs_to :order

  validates :quantity, presence: true, numericality: {only_integer: true, greater_than: 0}

  def available?
    product = self.product

    # should this be compared with product.stock?
    if self.quantity > product.quantity
      return false
    else
      return true
    end
  end
end
