class CreateEmployees < ActiveRecord::Migration[6.1]
  def change
    create_table :employees do |t|
      t.string :full_name
      t.date :joind_date
      t.string :health_care
      t.integer :payroll_id
      t.integer :novelty_id
      t.integer :user_id

      t.timestamps
    end
  end
end
