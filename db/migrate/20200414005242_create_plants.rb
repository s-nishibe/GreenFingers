class CreatePlants < ActiveRecord::Migration[5.2]
  def change
    create_table :plants do |t|
      t.string :name
      t.integer :type
      t.integer :weather
      t.string :temperature
      t.integer :water

      t.timestamps
    end
  end
end
