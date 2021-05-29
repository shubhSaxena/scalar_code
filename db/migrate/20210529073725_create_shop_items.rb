class CreateShopItems < ActiveRecord::Migration[6.1]
  def change
    create_table :shop_items do |t|
      t.references :shops, index: true
      t.references :items, index: true
      t.timestamps
    end
  end
end
