class Wallet < ActiveRecord::Base
  has_many :songs
  belongs_to :user
end