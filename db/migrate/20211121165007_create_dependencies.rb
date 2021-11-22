class CreateDependencies < ActiveRecord::Migration[6.1]
  def change
    create_table :dependencies do |t|
      t.string :name_dependency

      t.timestamps
    end
  end
end
