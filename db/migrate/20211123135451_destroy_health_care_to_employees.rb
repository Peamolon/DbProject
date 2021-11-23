class DestroyHealthCareToEmployees < ActiveRecord::Migration[6.1]
  def change
    remove_column :employees, :health_care
  end
end
