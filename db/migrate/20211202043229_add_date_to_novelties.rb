class AddDateToNovelties < ActiveRecord::Migration[6.1]
  def change
    add_column :novelties, :date, :date
  end
end
