class RemoveUserIdAndForumIdFromGroups < ActiveRecord::Migration
  def up
    remove_column :groups, :user_id
    remove_column :groups, :forum_id
  end

  def down
    add_column :groups, :forum_id, :integer
    add_column :groups, :user_id, :integer
  end
end
