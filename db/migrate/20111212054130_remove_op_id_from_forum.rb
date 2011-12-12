class RemoveOpIdFromForum < ActiveRecord::Migration
  def up
    remove_column :forums, :op_id
  end

  def down
    add_column :forums, :op_id, :integer
  end
end
