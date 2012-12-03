class AddMoreAttributesToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :cast, :text
    add_column :movies, :overview, :text
    add_column :movies, :tagline, :string
  end
end
