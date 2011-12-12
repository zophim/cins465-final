class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :phone
      t.boolean :admin
      t.string :encrypted_password
      t.boolean :active
      t.string :salt
      t.boolean :hide_vulgar
      t.date :DoB
      t.integer :group_id

      t.timestamps
    end
  end
end
