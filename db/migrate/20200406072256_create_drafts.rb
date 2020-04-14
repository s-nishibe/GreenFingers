class CreateDrafts < ActiveRecord::Migration[5.2]
  def change
    create_table :drafts do |t|
      t.integer :user_id, null: false
      t.string :title
      t.text :content, null: false
      t.string :eyecatch_img_id
      t.string :plant_name
      t.integer :plant_type, default: 1
      t.integer :weather, default: 1
      t.string :temperature
      t.boolean :water, default: false

      t.timestamps
    end
  end
end
