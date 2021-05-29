class CreateDeliveryPeople < ActiveRecord::Migration[6.1]
  def change
    create_table :delivery_people do |t|
      t.references :users, index: true
      t.string :license
      t.string :vehicle_no
      t.timestamps
    end
  end
end
