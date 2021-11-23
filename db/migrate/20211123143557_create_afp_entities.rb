class CreateAfpEntities < ActiveRecord::Migration[6.1]
  def change
    create_table :afp_entities do |t|
      t.string :afp_name

      t.timestamps
    end
  end
end
