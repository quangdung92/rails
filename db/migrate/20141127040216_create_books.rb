class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :book_name
      t.references :location
      t.string :author
      t.references :genre
      t.references :shop
      t.references :publisher
      t.integer :price
      t.integer :jan
      t.date :final_purchase
      t.date :final_sale
      t.date :publish_date
      t.integer :sale_number
      t.integer :inventory_number
      t.integer :nation_sale

      t.timestamps
    end
    add_index :books, :location_id
    add_index :books, :genre_id
    add_index :books, :shop_id
    add_index :books, :publisher_id
  end
end
