class UpdateDataBase < ActiveRecord::Migration[6.1]
  def change
    add_column :employees, :held_position_id, :integer
    remove_column :held_positions, :salary
    add_column :employees, :salary, :integer
  end
end
