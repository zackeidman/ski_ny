class CreatePostsTable < ActiveRecord::Migration
  def change
  	 create_table :posts do |t|
  	  t.string :user_id
   	  t.string :subject
   	  t.string :text
   	end
  end
end
