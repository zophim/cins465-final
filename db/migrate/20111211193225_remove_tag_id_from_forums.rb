class RemoveTagIdFromForums < ActiveRecord::Migration
  def up
    remove_column :forums, :tag_id
  end

  def down
    add_column :forums, :tag_id, :integer
  end
end
