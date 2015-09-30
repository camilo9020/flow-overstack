class Question < ActiveRecord::Base

	belongs_to :user
	has_many :answers, dependent: :destroy
	has_many :comments, as: :commenter, dependent: :destroy
	has_many :votes, as: :votable, dependent: :destroy
	validates :title, :description, presence: true

	def self.search(query)
		where("title like ? OR description like ?", "%#{query}%", "%#{query}%") 
	end

	
end
