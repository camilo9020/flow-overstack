# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(50)
#  email           :string(50)
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base

	has_secure_password
	has_many :questions, dependent: :destroy
	has_many :votes, dependent: :destroy
	has_many :answers, dependent: :destroy
	validates :password, presence: true, length: {maximum: 6}
	validates :name, presence: true, length: {maximum:55}
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: {maximum:255},
						format: { with: VALID_EMAIL_REGEX },
						uniqueness: true
	before_save { self.email = email.downcase }
end
