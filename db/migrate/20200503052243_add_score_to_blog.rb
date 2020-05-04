class AddScoreToBlog < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :score, :decimal, precision: 5, scale: 3, default: 0, null: false
  end
end
