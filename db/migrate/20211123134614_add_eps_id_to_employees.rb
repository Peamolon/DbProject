class AddEpsIdToEmployees < ActiveRecord::Migration[6.1]
  def change
    add_column :employees, :eps_id, :integer
  end
end
