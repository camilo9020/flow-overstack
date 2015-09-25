class SetDefaultanservotes < ActiveRecord::Migration
  
 def change
  	change_column :answers, :votes, :integer, :default => 0
  end


end
