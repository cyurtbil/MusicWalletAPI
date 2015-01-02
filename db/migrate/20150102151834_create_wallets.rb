class CreateWallets < ActiveRecord::Migration
  def change
    create_table :wallets do |t|
      t.string :name
      t.belongs_to :user, index: true
    end
  end
end
