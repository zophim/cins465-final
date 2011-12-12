class RemoveGroupIdFromTopics < ActiveRecord::Migration
  def up
    remove_column :topics, :group_id
  end

  def down
    add_column :topics, :group_id, :integer
  end
end
