class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commenter, polymorphic: true
  validates :body, presence: true
end
