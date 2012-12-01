class ChangeMoviesImageToText < ActiveRecord::Migration
  def change
    remove_column :movies, :image_url
    add_column :movies, :image_data, :text
  end
end
