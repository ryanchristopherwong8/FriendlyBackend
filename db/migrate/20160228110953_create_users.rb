class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :firstname
      t.string :lastname
      t.float :longitude
      t.float :latitude
      t.boolean :isLoggedIn

      t.timestamps null: false
    end
  end
end
