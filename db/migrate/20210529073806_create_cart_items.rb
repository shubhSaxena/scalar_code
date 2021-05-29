class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|
      t.references :carts, index: true
      t.references :shop_items, index: true
      t.integer :quantity, null: false, default: 0
      t.timestamps
    end
  end
end
