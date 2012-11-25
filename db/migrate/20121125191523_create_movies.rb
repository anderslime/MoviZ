class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies, :id => false do |t|
      t.string :movie_id, :primary_key => true
      t.string :title
      t.string :image_url
      t.integer :rating

      t.timestamps
    end

    add_index :movies, :movie_id, :unique => true
  end
end
