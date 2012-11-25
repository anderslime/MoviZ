class CreateMovieRelations < ActiveRecord::Migration
  def change
    create_table :movie_relations do |t|
      t.string :movie_id
      t.string :related_movie_id

      t.timestamps
    end

    add_index :movie_relations, [:movie_id, :related_movie_id]
  end
end
