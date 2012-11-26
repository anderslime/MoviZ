class CreateEdges < ActiveRecord::Migration
  def change
    create_table :edges do |t|
      t.string :source_id
      t.string :target_id
      t.integer :network_id

      t.timestamps
    end
  end
end
