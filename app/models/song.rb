class Song < ActiveRecord::Base
  belongs_to :wallet
  validates :name, presence: true, on: :create
end
