class RemoveOpIdFromTopic < ActiveRecord::Migration
  def up
    remove_column :topics, :op_id
  end

  def down
    add_column :topics, :op_id, :integer
  end
end
