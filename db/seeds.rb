# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


50.times do |n|
		title= Faker::Lorem.sentence(1)
		description= Faker::Lorem.sentence(3)
		Question.create!(user_id: n,
			             title: title,
			             description: description,
			             created_at:Time.zone.now)
  
end
