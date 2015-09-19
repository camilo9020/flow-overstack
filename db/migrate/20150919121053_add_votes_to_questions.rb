class AddVotesToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :votes, :string
  end
end
