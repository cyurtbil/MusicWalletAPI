class CreateAuthentications < ActiveRecord::Migration
  def change
    create_table :authentications do |t|
      t.string :provider
      t.string :uid
      t.string :access_token
      t.string :refresh_token
      t.datetime :expires_in
      t.string :scope
      t.belongs_to :user, index: true
    end
  end
end
