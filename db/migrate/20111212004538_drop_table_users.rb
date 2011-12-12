class DropTableUsers < ActiveRecord::Migration
  def up
    drop_table :users
  end

  def down
    create_table "users", :force => true do |t|
      t.string   "first_name"
      t.string   "last_name"
      t.string   "username"
      t.string   "phone"
      t.boolean  "admin"
      t.string   "encrypted_password"
      t.boolean  "active"
      t.string   "salt"
      t.boolean  "hide_vulgar"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.date     "DOB"
      t.integer  "group_id"
    end
  end
end