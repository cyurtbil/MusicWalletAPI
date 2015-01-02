class User < ActiveRecord::Base
  has_many :wallets
end