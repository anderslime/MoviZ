class AddRelatedStringToMovie < ActiveRecord::Migration
  def change
    add_column :movies, :related_string, :text
  end
end
