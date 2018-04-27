class Order < ApplicationRecord

  STATUS = %w(pending paid complete cancelled)

  has_many :order_items, dependent: :destroy


  validates :status, presence: true, inclusion: { in: STATUS }
  validates :email, presence: true
  validates :mail_adr, presence: true
  validates :cc_name, presence: true
  validates :cc_num, presence: true, numericality: {only_integer: true}, length: {is: 16}, :if => :confirm_payment?
  validates :cc_exp, presence: true
  validate :checks_expiration_date
  validates :cc_cvv, presence: true, numericality: {only_integer: true}, length: {is: 3}, :if => :confirm_payment?
  validates :bill_zip, presence: true, numericality: {only_integer: true}, :if => :confirm_payment?


  def confirm_payment?
    self.status == "paid"
  end

  def checks_expiration_date
    if !(cc_exp.nil? || cc_exp.empty?)
      if Date.strptime(cc_exp, '%m/%y') < Date.today
        errors.add(:cc_exp, "invalid expiration date")
      end
    end
  end



end
