class User < ActiveRecord::Base
  has_many :wallets
  has_many :authentications
end