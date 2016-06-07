class CreateProfilesTable < ActiveRecord::Migration
  def change
  	create_table :profiles do |item|
  		item.string :firstname 
  		item.string :lastname 
  	end 
  end
end
