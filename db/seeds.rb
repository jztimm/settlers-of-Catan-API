# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Deleting data...."

User.delete_all
Follow.delete_all

puts "starting...."
puts "Creating Seeds...."
puts "Generating Faker Data...."

5.times do 
   User.create(name: Faker::Name.unique.name, email: Faker::Internet.unique.email, password_digest: Faker::Internet.unique.password(max_length: 5) )
end

puts "Generating manual data...."

no_followers_nick = User.create(name: "Nick", email: Faker::Internet.unique.email, password_digest: Faker::Internet.password(max_length: 5))
followed_by_everyone_jimmy = User.create(name: "Jimmy", email: Faker::Internet.unique.email, password_digest: Faker::Internet.password(max_length: 5))
johns = User.create(name: "Johns", email: Faker::Internet.unique.email, password_digest: Faker::Internet.password(max_length: 5))

no_followers_nick.follow("Jimmy")
no_followers_nick.follow("Johns")

johns.follow("Jimmy")

p User.count
puts "Done!"

