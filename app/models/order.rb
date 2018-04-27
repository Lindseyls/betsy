class Order < ApplicationRecord

  STATUS = %w(pending paid complete cancelled)

  has_many :order_items, dependent: :destroy


with_options if: :checking_out? do |order|
 order.validates :status, presence: true, inclusion: { in: STATUS }
 order.validates :email, presence: true
 order.validates :mail_adr, presence: true
 order.validates :cc_name, presence: true
 order.validates :cc_num, presence: true, numericality: {only_integer: true}, length: {is: 16}
 order.validates :cc_exp, presence: true
 order.validates :cc_cvv, presence: true, numericality: {only_integer: true}, length: {is: 3}
 order.validates :bill_zip, presence: true, numericality: {only_integer: true}
end

 def checking_out?
   self.status != "pending"
 end

  def checks_expiration_date
    if !(cc_exp.nil? || cc_exp.empty?)
      if Date.strptime(cc_exp, '%m/%y') < Date.today
        errors.add(:cc_exp, "invalid expiration date")
      end
    end
  end



end
