class CreateProfilesTable < ActiveRecord::Migration
  def change
   create_table :profiles do |t|
     t.string :user_id
     t.string :text
   end
  end
end
