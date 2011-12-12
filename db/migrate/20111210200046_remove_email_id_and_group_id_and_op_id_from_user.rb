class RemoveEmailIdAndGroupIdAndOpIdFromUser < ActiveRecord::Migration
  def up
    remove_column :users, :email_id
    remove_column :users, :group_id
    remove_column :users, :op_id
  end

  def down
    add_column :users, :op_id, :integer
    add_column :users, :group_id, :integer
    add_column :users, :email_id, :integer
  end
end
