class Order < ApplicationRecord

  STATUS = %w(pending paid complete cancelled)

  has_many :order_items, dependent: :destroy

  validates :status, presence: true, inclusion: { in: STATUS }
  validates :email, presence:true
  validates :mail_adr, presence:true
  validates :cc_name, presence:true
  validates :cc_num, presence:true, numericality: {only_integer: true}, length: {is:16}
  validates :cc_exp, presence:true
  validates :cc_cvv, presence:true, numericality: {only_integer: true}, length: {is: 3}
  validates :bill_zip, presence:true, numericality: {only_integer:true}



end
