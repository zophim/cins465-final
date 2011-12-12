class RemoveOpFromUser < ActiveRecord::Migration
  def up
    remove_column :users, :op
  end

  def down
    add_column :users, :op, :boolean
  end
end
