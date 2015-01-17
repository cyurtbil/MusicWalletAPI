class Song < ActiveRecord::Base
  belongs_to :wallet
  validates :url, presence: true, on: :create
end
