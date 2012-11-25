class CreateNetworks < ActiveRecord::Migration
  def change
    create_table :networks do |t|
      t.integer :id

      t.timestamps
    end
  end
end
