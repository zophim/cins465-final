class AddWordToTag < ActiveRecord::Migration
  def change
    add_column :tags, :word, :string
  end
end
