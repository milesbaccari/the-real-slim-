class CreatePostsTable < ActiveRecord::Migration
  def change
  	create_table :posts do |item|
  		item.string :username 		
  		item.string :content 
  end
end
end
end 
