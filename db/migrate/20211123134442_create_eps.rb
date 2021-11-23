class CreateEps < ActiveRecord::Migration[6.1]
  def change
    create_table :eps_entities do |t|
      t.string :name_eps

      t.timestamps
    end
  end
end
