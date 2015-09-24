class RemoveColumns < ActiveRecord::Migration
  def self.up 
  	remove_column :questions, :user_id
  end
  
end
