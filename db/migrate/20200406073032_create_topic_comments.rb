class CreateTopicComments < ActiveRecord::Migration[5.2]
  def change
    create_table :topic_comments do |t|
      t.integer :user_id, null: false
      t.integer :topic_id, null: false
      t.string :image_id
      t.string :comment

      t.timestamps
    end
  end
end
