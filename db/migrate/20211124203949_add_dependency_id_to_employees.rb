class AddDependencyIdToEmployees < ActiveRecord::Migration[6.1]
  def change
    add_column :employees, :dependency_id, :integer
  end
end
