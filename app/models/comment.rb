# == Schema Information
#
# Table name: comments
#
#  id             :integer          not null, primary key
#  body           :text
#  user_id        :integer
#  commenter_id   :integer
#  commenter_type :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commenter, polymorphic: true
  validates :body, presence: true
end
