class EdgeIdsShouldBeIntegers < ActiveRecord::Migration
  def change
    remove_column :edges, :source_id
    remove_column :edges, :target_id
    add_column :edges, :source_id, :integer
    add_column :edges, :target_id, :integer
  end
end
