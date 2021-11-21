class DropEmployers < ActiveRecord::Migration[6.1]
  def up
    drop_table :employers
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
