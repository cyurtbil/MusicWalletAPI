class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :url
      t.belongs_to :wallet, index: true
    end
  end
end
