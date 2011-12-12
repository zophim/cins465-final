class AddOpIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :op_id, :integer
  end
end
