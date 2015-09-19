# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#Users
User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password_digest:     "foobar",
             created_at: Time.zone.now)


60.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password_digest:   password,
               created_at: (70-n).minutes.ago)

end

#Questions
	50.times do |n|
			title= Faker::Lorem.sentence(1)
			description= Faker::Lorem.sentence(5)
			Question.create!(user_id: n,
				             title: title,
				             votes: 0,
				             description: description,
				             created_at:(51-n).minutes.ago)
	end
# Answers
	50.times do |n|
	  body = Faker::Lorem.sentence(5)
        Answer.create!(body: body,
					   user_id: n, 
					   question_id: n,
					   votes: 2,
					   created_at: Time.zone.now)
	  	                                                            
	end