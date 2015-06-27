class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :tel
      t.string :address
      t.string :web_url

      t.timestamps null: false
    end
  end
end
