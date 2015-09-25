class Removevotesfromtables < ActiveRecord::Migration
  
  def self.up 
  	remove_column :questions, :votes
  	remove_column :answers, :votes
  end


end
