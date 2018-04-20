class User < ApplicationRecord
  has_many :products
  
  validate :username presence:true, uniqueness:true
  validate :email presence:true, uniqueness: true

  def self.info_from_auth_hash(provider, auth_hash)
    user = new
    user.provider = provider
    user.uid = auth_hash['uid']
    user.username = auth_hash['info']['username']
    user.email = auth_hash['info']['email']

  end
end
