require "test_helper"

describe Order do
  let(:order) { Order.new }
  let(:order1) { orders(:order_1) }

  describe "relations" do
    it "has a list of order_items" do
      order1.order_items.each do |item|
        item.must_be_instance_of OrderItem
        item.order.must_be_instance_of Order
        item.order.must_equal order1
      end
    end
  end

  describe "validations" do
    before do
      @order = Order.new(email: "rufo@petsy.com", mail_adr: "2615 233rd SE, Sammamish, WA",
        cc_name: "Rufino Woof", cc_num: "9875632147652345", cc_exp: "09/22", cc_cvv: "987",
        bill_zip: "98075", status: "paid")
      end

      describe "validations" do
        it "must have a mailing address" do
          @order.mail_adr = nil
          @order.valid?.must_equal false
        end

        it "must have a name in the credit card information" do
          @order.cc_name = nil
          @order.valid?.must_equal false
          @order.cc_name = "Rufino Woof"
          @order.valid?.must_equal true
        end

        it "must have an email address" do
          @order.email.must_equal "rufo@petsy.com"
          @order.valid?.must_equal true
          @order.email = nil
          @order.valid?.must_equal false
        end

        it "must have a billing zip code number" do
          @order.bill_zip.must_equal "98075"
          @order.valid?.must_equal true

          [nil,"","wooof"].each do |num|
            @order.bill_zip = num
            @order.valid?.must_equal false
          end
        end


        it "must have a credit card number of 16 digits" do
          @order.cc_num.must_equal "9875632147652345"
          @order.valid?.must_equal true

          [nil,"45638","raaaa",""].each do |num|
            @order.cc_num = num
            @order.valid?.must_equal false
          end
        end

        it "must include a CVV number of 3 digits" do
          [nil,"18294673","fuw"].each do |num|
            @order.cc_cvv = num
            @order.valid?.must_equal false
          end

          ["345","182","666"].each do |num|
            @order.cc_cvv = num
            @order.valid?.must_equal true
          end
        end

        it "must have a credit card expiration date that is not past from current date" do
          ["09/16", nil, ""].each do |num|
            @order.cc_exp = num
            @order.valid?.must_equal false
          end

          ["09/18","11/20"].each do |num|
            @order.cc_exp = num
            @order.valid?.must_equal true
          end
        end

      end
    end
  end
