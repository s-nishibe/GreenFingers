class CreateUserRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :user_relations do |t|
      t.integer :user_id, null: false
      t.integer :follow_id, null: false

      t.timestamps
    end
  end
end
