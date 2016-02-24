# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Container.delete_all
Authentication.delete_all

Container.create(data: File.open('task.txt'))
Authentication.create(email: '4laconic@gmail.com', password: '23785614')

5.times do
	Authentication.create 	email: Faker::Internet.email,
							password: Faker::Internet.password(8, 16, true)	
end