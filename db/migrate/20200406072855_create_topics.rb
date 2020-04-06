class CreateTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :topics do |t|
      t.integer :user_id, null: false
      t.string :title, null: false
      t.string :eyecatch_img_id

      t.timestamps
    end
  end
end
