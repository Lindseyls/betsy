require "test_helper"

describe UsersController do

  let(:user) {users(:one)}

  it "Users#Account" do
    login(user)
    get user_account_path(user.id)
    must_respond_with :success
  end

  describe "OrderFulfillment Page" do
    let (:one) {users(:one)}

    it "shows a user's order fulfillment page " do
      login(one)

      get user_orders_path(one.id)

      must_respond_with :success
    end

    it "renders 404 if user does not exist" do
      bogus_user_id = (User.last.id) + 1

      get user_orders_path(bogus_user_id)
      must_respond_with :not_found

    end
  end
end
