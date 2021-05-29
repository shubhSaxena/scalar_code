class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :users, index: true
      t.references :delivery_peoples, index: true
      t.references :shops, index: true
      t.references :carts, index: true
      t.string :status
      t.float :price
      t.timestamps
    end
  end
end
