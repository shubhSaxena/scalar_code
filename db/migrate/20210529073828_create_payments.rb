class CreatePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :payments do |t|
      t.references :orders, index: true
      t.string :payment_link
      t.string :status
      t.string :payment_type
      t.timestamps
    end
  end
end
