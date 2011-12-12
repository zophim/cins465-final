class RemoveWorkFromTag < ActiveRecord::Migration
  def up
    remove_column :tags, :work
  end

  def down
    add_column :tags, :work, :string
  end
end
