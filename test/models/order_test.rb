require "test_helper"

describe Order do
  let(:order) { Order.new }
  let(:order1) { orders(:order_2) }#status complete
  let(:order2) { orders(:order_1) }#staus pending

  describe "relations" do
    it "has a list of orderitems" do
      order1.order_items.each do |item|
        item.must_be_instance_of OrderItem
        item.order.must_be_instance_of Order
        item.order.must_equal order1
      end
    end
  end

  describe "validations" do
    it "validates the presence of a status" do
      order1.status = nil
      order1.valid?.must_equal false
      order1.errors.messages.must_include :status

      order1.status = ""
      order1.valid?.must_equal false
      order1.errors.messages.must_include :status
    end

    it "has an email adress" do
      order1.email = nil
      order1.valid?.must_equal false
      order1.errors.messages.must_include :email

      order1.email = ""
      order1.valid?.must_equal false
      order1.errors.messages.must_include :email

      order1.valid?.must_equal true
    end

    it "has an mailing address" do
      order1.mail_address = nil
      order.valid?.must_equal false
      order1.errors.messages.must_include :mail_adress

      order1.mail_adress = ""
      order1.valid?.must_equal false
      order1.errors.messages.must_include :mail_adress

      order1.valid?.must_equal true
    end

    it "has a name for the credit card" do
      order1.cc_name = nil
      order.valid?.must_equal false
      order1.errors.messages.must_include :cc_name

      order1.cc_name = ""
      order1.valid?.must_equal false
      order1.errors.messages.must_include :cc_name

      order1.cc_name "Dan"
      order1.valid?.must_equal true
    end

    it "has a 16 digits in length number for the credit card" do
      [782948281, 9876543219876543].each {|element|
        o.credit_card = element
        o.valid?.must_equal false
      }
    end

    it "validation for credit card presence" do
      order.cc_num= nil
      order.valid?.must_equal false
      order1.errors.messages.must_include :cc_num

      order1.cc_num = ""
      order1.valid?.must_equal false
      order1.errors.messages.must_include :cc_num

      order1.valid?.must_equal true
    end

    it "validation for cc_cvv presence" do
      order.cc_cvv= nil
      order.valid?.must_equal false
      order1.errors.messages.must_include :cc_expiry

      order1.cc_expiry = ""
      order1.valid?.must_equal false
      order1.errors.messages.must_include :cc_expiry

      order1.valid?.must_equal true
    end

    it "validation for cc_cvv presence" do
      order.cc_cvv= nil
      order.valid?.must_equal false
      order1.errors.messages.must_include :cc_cvv

      order1.cc_cvv = ""
      order1.valid?.must_equal false
      order1.errors.messages.must_include :cc_cvv

      order1.valid?.must_equal true
    end

    it "validation for billing_zip presence" do
      order.billing_zip= nil
      order.valid?.must_equal false
      order1.errors.messages.must_include :billing_zip

      order1.billing_zip = ""
      order1.valid?.must_equal false
      order1.errors.messages.must_include :billing_zip

      order1.valid?.must_equal true
    end
  end

end
