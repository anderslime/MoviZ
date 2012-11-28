class AddCompletedToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :completed, :boolean
  end
end
