class FixJoinDateColumn < ActiveRecord::Migration[6.1]
  def change
    rename_column :employees, :joind_date, :join_date
  end
end
