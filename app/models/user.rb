class User < ApplicationRecord
  has_many :products

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  def self.info_from_github(auth_hash)

    @user = User.new(
      username: auth_hash[:info][:username],
      email: auth_hash[:info][:email],
      uid: auth_hash[:uid],
      provider: auth_hash[:provider])

      if @user.save

        return @user

      else

        return @user

      end

    end
  end
