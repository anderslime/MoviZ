class AddAttributesToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :released, :integer
    add_column :movies, :genres, :text
    add_column :movies, :director, :text
  end
end
