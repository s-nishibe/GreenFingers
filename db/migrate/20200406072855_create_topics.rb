class CreateTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :topics do |t|
      t.integer :user_id, null: false
      t.string :title, null: false
      t.string :eyecatch_img_id
      t.integer :category, default: 1
      t.boolean :status, default: false

      t.timestamps
    end
  end
end
