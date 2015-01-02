class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :name
      t.belongs_to :wallet, index: true
    end
  end
end
