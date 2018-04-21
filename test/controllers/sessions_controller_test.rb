require "test_helper"

describe SessionsController do
  describe 'auth_callback' do
    it "creates a new user" do

    end

    it "logs in existing user" do
      # arrange
      user = User.first
      original_count = User.count

      OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new(mock_auth_hash(user))

      # act
      get auth_callback_path(:github)

      # assert

      must_redirect_to root_path
      User.count.must_equal original_count
      session[:user_id].must_equal user.id

    end

    it "does not log in with invalid data" do

    end

  end

  describe 'create' do

  end

end
