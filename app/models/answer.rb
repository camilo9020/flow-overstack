class Answer < ActiveRecord::Base
  belongs_to :question
  has_many :comments, as: :commenter
end
