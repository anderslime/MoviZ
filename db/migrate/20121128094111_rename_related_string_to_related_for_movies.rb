class RenameRelatedStringToRelatedForMovies < ActiveRecord::Migration
  def change
    rename_column :movies, :related_string, :related
  end
end
