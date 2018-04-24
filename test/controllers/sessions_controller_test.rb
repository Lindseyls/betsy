require "test_helper"

describe SessionsController do
  describe 'auth_callback' do
    it "creates a new user" do
      user = User.new(provider: 'github', uid: 76621, email: 'mail4@me.org', username: 'Lemuel Larsky')

      user.must_be :valid?
      original_count = User.count

      # act
      login(user)

      # assert

      must_redirect_to root_path
      User.count.must_equal original_count + 1
      session[:user_id].must_equal User.last.id



    end

    it "logs in existing user" do
      # arrange
      user = User.first
      original_count = User.count

      # act
      login(user)

      # assert

      must_redirect_to root_path
      User.count.must_equal original_count
      session[:user_id].must_equal user.id

    end

    it "does not log in with invalid data" do
      user = User.new(provider: 'github', uid: nil , email: 'mail@me.org', username: 'Milkah Lamb')

      user.wont_be :valid?

<<<<<<< HEAD
      user.wont_be :valid?
=======
>>>>>>> ecd0469ed71cac21a8d3a69d12d03fe8fb0fa38b
      original_count = User.count

      # act
      login(user)

      # assert

      must_redirect_to root_path
      User.count.must_equal original_count


    end


    describe 'create' do

    end

  end
end
