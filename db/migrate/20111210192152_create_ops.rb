class CreateOps < ActiveRecord::Migration
  def change
    create_table :ops do |t|
      t.integer :user_id
      t.integer :forum_id

      t.timestamps
    end
  end
end
