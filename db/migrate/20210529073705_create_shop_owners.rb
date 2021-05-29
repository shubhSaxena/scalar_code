class CreateShopOwners < ActiveRecord::Migration[6.1]
  def change
    create_table :shop_owners do |t|
      t.references :users, index: true
      t.string :registration_number
      t.timestamps
    end
  end
end
