class AddApiIdToMovies < ActiveRecord::Migration
  def up
    add_column :movies, :api_id, :string
    remove_column :movies, :movie_id
    add_column :movies, :movie_id, :integer, :primary_key => true
  end
  
  def down
    remove_column :movies, :api_id, :string
    add_column :movies, :movie_id, :string, :primary_key => true
    remove_column :movies, :movie_id, :integer
  end
end
