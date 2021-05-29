class CreateDeliveryPersonLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :delivery_person_locations do |t|
      t.references :delivery_peoples, index: true
      t.string :location
      t.timestamps
    end
  end
end
