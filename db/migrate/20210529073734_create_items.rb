class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :product_category
      t.float :price, null: false
      t.integer :quantity, null: false, default: 0
      t.string :sku_details
      t.string :barcode
      t.timestamps
    end
  end
end
