class AddNameAndGenderAndAgeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :gender, :boolean
    add_column :users, :age, :string
  end
end
