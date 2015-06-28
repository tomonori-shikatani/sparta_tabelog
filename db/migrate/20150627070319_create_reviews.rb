class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :body, null: false
      t.integer :satisfaction, null: false
      t.references :user, index: true, foreign_key: true
      t.references :restaurant, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :reviews, [:user_id, :restaurant_id], unique: true
  end
end
