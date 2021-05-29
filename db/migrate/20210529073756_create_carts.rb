class CreateCarts < ActiveRecord::Migration[6.1]
  def change
    create_table :carts do |t|
      t.references :users, index: true
      t.references :shops, index: true
      t.float :total_price
      t.timestamps
    end
  end
end
