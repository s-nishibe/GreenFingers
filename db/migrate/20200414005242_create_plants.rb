class CreatePlants < ActiveRecord::Migration[5.2]
  def change
    create_table :plants do |t|
      t.string :name
      t.integer :type, default: 0, null: false
      t.integer :weather, default: 0, null: false
      t.string :temperature, default: '', null: false
      t.integer :water, default: false, null: false

      t.timestamps
    end
  end
end
