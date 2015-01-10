class Wallet < ActiveRecord::Base
  has_many :songs
  belongs_to :user

  def self.create_wallets(user)
    self.new([{name: 'Dark'},
              {name: 'Chill'},
              {name: 'Happy'},
              {name: 'Party'},
              {name: 'Dance'},
              {name: 'Sport'},
              {name: 'Mixed Moods'},
              {name: 'Pumped'},
              {name: 'Sad'},
              {name: 'Angry'},
              {name: 'Dreamy'},
              {name: 'Illegal'}])
    self.all.user_id = user.id
    self.save
  end
end