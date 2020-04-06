class CreateBlogComments < ActiveRecord::Migration[5.2]
  def change
    create_table :blog_comments do |t|
      t.integer :user_id, null: false
      t.integer :blog_id, null: false
      t.string :comment
      t.string :image_id

      t.timestamps
    end
  end
end
