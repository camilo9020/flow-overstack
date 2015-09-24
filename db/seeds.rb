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
             password:  "foobar",
             password_confirmation: "foobar",
             created_at: Time.zone.now)




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