class AddDistancetoUser < ActiveRecord::Migration
  def up
  	add_column :users, :longitude, :decimal, precision: 10, scale: 6 
  	add_column :users, :latitude, :decimal, precision: 10, scale: 6 
  end

  def down
  	remove_column :users, :longitude, :decimal
  	remove_column :users, :latitude, :decimal
  end

end
