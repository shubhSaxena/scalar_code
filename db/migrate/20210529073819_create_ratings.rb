class CreateRatings < ActiveRecord::Migration[6.1]
  def change
    create_table :ratings do |t|
      t.string :rating_type, index: true
      t.bigint :rating_id, index: true
      t.references :orders, index: true
      t.integer :rating
      t.timestamps
    end
  end
end
