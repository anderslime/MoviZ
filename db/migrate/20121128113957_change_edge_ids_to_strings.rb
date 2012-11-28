class ChangeEdgeIdsToStrings < ActiveRecord::Migration
  def change
    change_table :edges do |t|
      t.change :source_id, :string
      t.change :target_id, :string
    end
  end
end
