class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.integer :user_id, null: false
      t.string :title
      t.text :content, null: false
      t.string :eyecatch_img_id

      t.timestamps
    end
  end
end
