class RemoveInabiityToNovelties < ActiveRecord::Migration[6.1]
  def change
    add_column :novelties, :novelty_type, :string
    remove_column :novelties, :inability
    remove_column :novelties, :vacations
  end
end
