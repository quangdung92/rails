class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :location_name
      t.references :shop

      t.timestamps
    end
    add_index :locations, :shop_id
  end
end
