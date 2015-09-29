class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :question, index: true, foreign_key: true
      t.text :body
      t.integer :votes

      t.timestamps null: false
    end
  end
end
