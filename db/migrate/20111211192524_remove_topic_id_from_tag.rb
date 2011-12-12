class RemoveTopicIdFromTag < ActiveRecord::Migration
  def up
    remove_column :tags, :topic_id
  end

  def down
    add_column :tags, :topic_id, :integer
  end
end
