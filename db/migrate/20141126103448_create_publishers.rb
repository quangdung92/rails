class CreatePublishers < ActiveRecord::Migration
  def change
    create_table :publishers do |t|
      t.string :publisher_name
      t.references :shop

      t.timestamps
    end
    add_index :publishers, :shop_id
  end
end
