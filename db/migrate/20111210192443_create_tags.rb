class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.integer :topic_id
      t.string :work

      t.timestamps
    end
  end
end
