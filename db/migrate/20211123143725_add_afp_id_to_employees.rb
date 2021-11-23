class AddAfpIdToEmployees < ActiveRecord::Migration[6.1]
  def change
    add_column :employees, :afp_entity_id, :integer
  end
end
