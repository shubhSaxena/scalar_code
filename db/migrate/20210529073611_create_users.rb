class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false, index: true
      t.string :password, null: false, index: true
      t.string :phone, null: false
      t.string :type, index: true
      t.timestamps
    end
  end
end
