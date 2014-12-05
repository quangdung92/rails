class CreateGenres < ActiveRecord::Migration
  def change
    create_table :genres do |t|
      t.string :genre_name
      t.references :shop

      t.timestamps
    end
    add_index :genres, :shop_id
  end
end
