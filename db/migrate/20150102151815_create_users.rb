class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :image_url
      t.string :token
      t.integer :followers_count
      t.integer :followings_count
    end
  end
end
