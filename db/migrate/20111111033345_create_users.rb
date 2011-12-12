class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.integer :email_id
      t.string :phone
      t.integer :group_id
      t.boolean :admin
      t.boolean :op
      t.string :encrypted_password
      t.integer :age
      t.boolean :active
      t.string :salt
      t.boolean :hide_vulgar

      t.timestamps
    end
  end
end
