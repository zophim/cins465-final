class RemoveEmailIdFromUser < ActiveRecord::Migration
  def up
    remove_column :users, :email_id
  end

  def down
    add_column :users, :email_id, :integer
  end
end
