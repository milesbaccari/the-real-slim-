class CreateUsersTable < ActiveRecord::Migration
  def change
  	create_table :users do |item|
  		item.string :username
  		item.string :password 
  	end 
  end
end
