class Wallet < ActiveRecord::Base
  has_many :songs
  belongs_to :user

  def self.create_wallets(user)
    wallet_names = ['Dark', 'Chill', 'Party', 'Happy', 'Dance', 'Sport', 'Mixed Moods', 'Pumped', 'Sad', 'Angry', 'Dreamy', 'Illegal']

    wallet_names.each do |wallet|
      self.create({name: wallet, user_id: user.id})
    end
  end
end