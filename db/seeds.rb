# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

puts "Cleaning up database..."
Review.destroy_all
Booking.destroy_all
Activity.destroy_all
User.destroy_all
puts "Database cleaned"

puts 'Creating 10 fake users...'

users = []
activities = []
categories = ["Art & Culture", "Entertainment", "Food & Drink", "Sports", "Tours", "Sightseeing", "Nature & Outdoors"]

10.times do |i|
  user = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    username: Faker::Internet.user('username'),
    email: Faker::Internet.user('email'),
    password: Faker::Internet.password,
  )
  puts "Created user in DB with id #{user.id}"
  users << user
end

10.times do |i|
  activity = Activity.create(
    user_id: users.sample.id,
    title: Faker::Hobby.activity,
    description: Faker::Lorem.paragraphs,
    category: categories.sample,
    localization: Faker::Address.city,
    image: Faker::LoremFlickr.image(size: "1000x500", search_terms: ['sports', 'fitness', 'sightseeing', 'nature', 'hobby'])
  )
  puts "Created activity in DB with id #{activity.id}"
  activities << activity
end

# create 5 bookings
5.times do |i|
  booking = Booking.create(
    user_id: users.sample.id,
    activity_id: activities.sample.id
  )
  puts "Created booking in DB with id #{booking.id}"
end

puts "Finished!"
