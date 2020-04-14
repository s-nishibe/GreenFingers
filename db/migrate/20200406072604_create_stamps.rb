class CreateStamps < ActiveRecord::Migration[5.2]
  def change
    create_table :stamps do |t|
      t.integer :user_id, null: false
      t.integer :blog_id, null: false
      t.integer :stamp_img, default: '', null: false

      t.timestamps
    end
  end
end
