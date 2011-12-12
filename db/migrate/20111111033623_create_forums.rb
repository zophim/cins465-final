class CreateForums < ActiveRecord::Migration
  def change
    create_table :forums do |t|
      t.string :title
      t.boolean :vulgar
      t.integer :user_id
      t.boolean :private
      t.integer :group_id
      t.integer :op_id
      t.boolean :active
      t.integer :tag_id

      t.timestamps
    end
  end
end
