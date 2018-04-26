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
    price = self.product.price
    quantity = self.quantity
    sub_total = price * quantity

    return sub_total
  end

  def total_sum
    total = 0
    self.each do |item|
      sub_total = item.sub_total
      total =+ sub_total
      return total
    end
  end

  #
  # def total_sum
  #   sub_total = self.sub_total
  #   self.each do |sub_total|
  #     order_total_sum += sub_total
  #   end
  #   return order_total_sum
  # end
end
