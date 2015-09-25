class 	ChangeVotesTypeInQuestions				 < ActiveRecord::Migration
  def change
	change_column :questions, :votes, :integer
  end
end
