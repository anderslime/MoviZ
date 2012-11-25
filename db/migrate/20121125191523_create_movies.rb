class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :rovi_id
      t.string :title
      t.string :image_url
      t.integer :rating

      t.timestamps
    end
  end
end
