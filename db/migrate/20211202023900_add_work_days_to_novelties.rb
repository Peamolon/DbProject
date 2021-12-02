class AddWorkDaysToNovelties < ActiveRecord::Migration[6.1]
  def change
    add_column :novelties, :work_days, :integer
  end
end
