class CreateNovelties < ActiveRecord::Migration[6.1]
  def change
    create_table :novelties do |t|
      t.boolean :inability
      t.boolean :vacations
      t.integer :disabilty_days
      t.integer :vacations_days
      t.date :vacations_start_date
      t.date :vacations_end_date
      t.date :disability_start_date
      t.date :disabily_end_date
      t.integer :employee_id

      t.timestamps
    end
  end
end
