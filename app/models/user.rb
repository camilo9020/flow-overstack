class User < ActiveRecord::Base

	before_save { self.email = email.downcase }
	has_many :questions, dependent: :destroy
	has_many :votes, dependent: :destroy
	has_many :answers, dependent: :destroy
	

	validates :name, presence: true, length: {maximum:55}

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: {maximum:255},
						format: { with: VALID_EMAIL_REGEX },
						uniqueness: true
	has_secure_password
	validates :password, presence: true, length: {maximum: 6}

	def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
	

end
