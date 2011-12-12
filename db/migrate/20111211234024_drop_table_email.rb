class DropTableEmail < ActiveRecord::Migration
  def up
    drop_table :emails
  end

  def down
    create_table "emails", :force => true do |t|
      t.integer  "user_id"
      t.string   "email"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end
end
