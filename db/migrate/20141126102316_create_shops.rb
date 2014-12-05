class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.integer :shop_no, null: false
      t.string :shop_name, null: false

      t.timestamps
    end
  end
end
