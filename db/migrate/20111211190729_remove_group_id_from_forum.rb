class RemoveGroupIdFromForum < ActiveRecord::Migration
  def up
    remove_column :forums, :group_id
  end

  def down
    add_column :forums, :group_id, :integer
  end
end
