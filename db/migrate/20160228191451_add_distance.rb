class AddDistance < ActiveRecord::Migration
  def change
  	add_column :users, :distance, :decimal, { precision: 10, scale: 6 }
  end
end
