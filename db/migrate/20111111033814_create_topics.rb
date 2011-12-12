class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :title
      t.integer :user_id
      t.integer :forum_id
      t.boolean :vulgar
      t.boolean :private
      t.integer :group_id
      t.integer :op_id
      t.boolean :active
      t.integer :tag_id

      t.timestamps
    end
  end
end
