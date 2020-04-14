class CreatePlants < ActiveRecord::Migration[5.2]
  def change
    create_table :plants do |t|
      t.integer :user_id, null: false
      t.string :name
      t.integer :type, default: 0, null: false
      t.text :memo, null: false
      t.timestamps
    end
  end
end
