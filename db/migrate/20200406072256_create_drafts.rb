class CreateDrafts < ActiveRecord::Migration[5.2]
  def change
    create_table :drafts do |t|
      t.integer :user_id, null: false
      t.string :title, default: '', null: false
      t.text :content, default: '', null: false
      t.string :eyecatch_img_id, default: '', null: false
      t.string :plant_name, default: '', null: false
      t.integer :plant_type, default: 1, null: false
      t.integer :weather, default: 1, null: false
      t.string :temperature, default: '', null: false
      t.boolean :water, default: false, null: false

      t.timestamps
    end
  end
end
