class OrderItem < ApplicationRecord
  belongs_to :product
  belongs_to :order

  validates :quantity, presence: true, numericality: {only_integer: true, greater_than: 0}
  # validate :available?
  # validate :available_quantity

  # def available?
  #   product = self.product
  #   if product.stock == 0
  #     errors.add(:stock, "out of stock")
  #   end
  # end

  # def available_quantity
  #   quantity = self.quantity
  #   if quantity > self. product.stock
  #     errors.add(:stock, "is #{self.product.stock}")
  #   end

  def find_name
    # given order, with product_id
    # compare that p_i with product_id in the products table (product_id)

  end

  def sub_total
    total = 0
    self.product.each do |product|
      total += product.price
    end

    return total
  end

end
