class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name, null: false
      t.string :tel, null: false
      t.string :address, null: false
      t.string :web_url, null: false

      t.timestamps null: false
    end
  end
end
