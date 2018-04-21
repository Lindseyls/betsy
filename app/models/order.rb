class Order < ApplicationRecord

  STATUS = %w(pending paid complete cancelled)

  has_many :order_items, dependent: :destroy

  validates :status, presence: true, inclusion: { in: STATUS }
end
