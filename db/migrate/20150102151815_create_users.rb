class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :username
      t.integer :followers_count
      t.integer :following_count
    end
  end
end
