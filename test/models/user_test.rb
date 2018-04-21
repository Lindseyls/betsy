require "test_helper"

describe User do
  let(:user) { User.new }
  let(:one) { users(:one) }

  describe "relations" do
    it "has a list of products" do

    end

    it "shows zero if user has no products" do
      
    end
  end

  describe "validations" do
    it "must be valid" do
      one.must_be :valid?
    end

    it "must have a username" do
      user.email = "email"
      user.username = "   "
      user.valid?.must_equal false

      user.username = "test username"
      user.valid?.must_equal true
    end

    it "username must be unique" do
      one.username.must_equal "puppy"
      user.email = "email2"
      user.username = "puppy"
      user.valid?.must_equal false
    end

    it "must have an email" do
      user.username = "username"
      user.email = "    "
      user.valid?.must_equal false

      user.email = "email3"
      user.valid?.must_equal true
    end

    it "email must be unique" do
      one.email.must_equal "puppy@petsy.com"
      user.username = "name2"
      user.username = "puppy@petsy.com"
      user.valid?.must_equal false
    end
  end
end
