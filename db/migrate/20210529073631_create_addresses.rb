class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.references :users, index: true
      t.string :address
      t.string :location
      t.boolean :active
      t.timestamps
    end
  end
end
