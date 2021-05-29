class CreateShops < ActiveRecord::Migration[6.1]
  def change
    create_table :shops do |t|
      t.references :shop_owners, index: true
      t.string :name
      t.string :location
      t.timestamps
    end
  end
end
