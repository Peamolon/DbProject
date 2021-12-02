class AddBonusToNovelties < ActiveRecord::Migration[6.1]
  def change
    add_column :novelties, :bonus, :integer
    add_column :novelties, :transport, :integer
  end
end
