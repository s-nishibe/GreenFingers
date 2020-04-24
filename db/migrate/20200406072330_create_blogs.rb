class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.integer :user_id, null: false
      t.integer :plant_id, null: false
      t.string :title, default: '', null: false
      t.text :content, null: false
      t.string :eyecatch_img_id, default: '', null: false
      t.integer :weather, default: 0, null: false
      t.string :temperature, default: '', null: false
      t.boolean :water, default: false, null: false
      t.boolean :status, default: false, null: false

      t.timestamps
    end
  end
end
