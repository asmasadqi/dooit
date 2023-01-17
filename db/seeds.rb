# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

puts "Cleaning up database..."
User.destroy_all
puts "Database cleaned"

puts 'Creating 10 fake users...'

users = []
categories = ["Art & Culture", "Entertainment", "Food & Drink", "Sports", "Tours", "Sightseeing", "Nature & Outdoors"]

10.times do |i|
  user = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    username: Faker::Internet.user('username'),
    email: Faker::Internet.user('email'),
    password: Faker::Internet.password,
  )
  puts "Created user with id #{user.id}"
  users << user
end

puts users

10.times do |i|
  activity = Activity.create(
    user_id: users.sample.id,
    title: Faker::Hobby.activity,
    description: Faker::String.random(length: 3..12),
    category: categories.sample,
    localization: Faker::Address.city
  )
  puts "Created activity with id #{activity.id}"
end

puts "Finished!"
