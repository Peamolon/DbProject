class Rename < ActiveRecord::Migration[6.1]
  def change
    rename_column :novelties, :disabily_end_date, :disability_end_date
  end
end
