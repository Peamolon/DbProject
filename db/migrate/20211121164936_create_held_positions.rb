class CreateHeldPositions < ActiveRecord::Migration[6.1]
  def change
    create_table :held_positions do |t|
      t.string :name_position
      t.integer :dependency_id
      t.integer :salary

      t.timestamps
    end
  end
end
