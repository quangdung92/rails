class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_id
      t.string :password
      t.string :name
      t.string :uid
      t.integer :shop_no

      t.timestamps
    end
  end
end
