require 'faker'

puts "Cleaning up database..."
Review.destroy_all
Booking.destroy_all
Activity.destroy_all
User.destroy_all
puts "Database cleaned"

puts 'Creating 12 fake users...'

users = []
activities = []
bookings = []

lena = User.create(
  first_name: "Lena",
  last_name: "Ansari",
  username: "lenaa",
  email: "lenaansari@gmail.com",
  password: "123456"
)

activity_lena = Activity.create(
  user_id: lena.id,
  title: "Fishing",
  description: "You'll be in our boat to go fishing in beautiful locations we have spotted. Catches of the day will be cooked for lunch by our wonderful chef.",
  category: "Outdoors",
  localization: "Cassis",
  price_per_day: 75,
  image: "https://source.unsplash.com/random/?fishing"

)

12.times do |i|
  user = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    username: Faker::Internet.user('username'),
    email: Faker::Internet.user('email'),
    password: Faker::Internet.password
  )
  puts "Created user in DB with id #{user.id}"
  users << user
end

activity = Activity.create(
  user_id: users.sample.id,
  title: "Drink with Paul P",
  description: "SHOT SHOT SHOT!",
  category: "Entertainment",
  localization: "Les Marquises",
  price_per_day: 999999,
  image: "https://res.cloudinary.com/dg5wojcq5/image/upload/v1674918595/IMG_0123_q12rnx.jpg"
)
activity = Activity.create(
  user_id: users.sample.id,
  title: "Cooking",
  description: "Learn to cook amazing dishes with Laura, who owns many well-known restaurants in town.",
  category: "Food",
  localization: "Paris",
  price_per_day: 50,
  image: "https://source.unsplash.com/random/?cooking"

)
activity = Activity.create(
  user_id: users.sample.id,
  title: "Surf",
  description: "Your local instructor will take you to the most beautiful beaches acording to your surfing skills and the day's condition.",
  category: "Sports",
  localization: "Fuerteventura",
  price_per_day: 30,
  image: "https://source.unsplash.com/random/?surf"

)

activity = Activity.create(
  user_id: users.sample.id,
  title: "Sightseeing in Rome",
  description: "Discover Rome with our local guide. He will take you to touristic attractions such as: Colosseum, Roman Forum and many other places.",
  category: "Sightseeing",
  localization: "Rome",
  price_per_day: 50,
  image: "https://source.unsplash.com/random/?rome"

)
activity = Activity.create(
  user_id: users.sample.id,
  title: "Snowboard",
  description: "Take our snowboard class this winter to level your skills up!",
  category: "Sports",
  localization: "Chamonix",
  price_per_day: 60,
  image: "https://source.unsplash.com/random/?snowboard"

)

activity = Activity.create(
  user_id: users.sample.id,
  title: "Wine Tasting",
  description: "Visit our winery in Hermitage with Thomas. He will take you to a tour to discover our wine production method. You will finish the visit with a wine tasting.",
  category: "Food",
  localization: "Lyon",
  price_per_day: 50,
  image: "https://source.unsplash.com/random/?wine"

)
activity = Activity.create(
  user_id: users.sample.id,
  title: "Bouldering",
  description: "We will go the Climb'Up for morning lessons. The instructor will guide you according to your level.",
  category: "Sports",
  localization: "Paris",
  price_per_day: 50,
  image: "https://source.unsplash.com/random/?bouldering"

)
activity = Activity.create(
  user_id: users.sample.id,
  title: "Escape Game",
  description: "You have 2 hours to find the answer to escape from a locked room full of hidden messages...",
  category: "Entertainment",
  localization: "London",
  price_per_day: 45,
  image: "https://source.unsplash.com/random/?escape-room"

)
activity = Activity.create(
  user_id: users.sample.id,
  title: "Buggy Rental",
  description: "Rent your own buggy for the day to take a nice tour in the desert of Namibia. Local guides will follow your ride to take you to breathtaking spots.",
  category: "Tours",
  localization: "Namibia",
  price_per_day: 150,
  image: "https://source.unsplash.com/random/?buggy"

)
activity = Activity.create(
  user_id: users.sample.id,
  title: "Pottery",
  description: "Make your own ceramic bowl from scratch, you will enjoy your meal everytime you fill you fill your own bowl with food.",
  category: "Culture",
  localization: "Berlin",
  price_per_day: 80,
  image: "https://source.unsplash.com/random/?pottery"

)
activity = Activity.create(
  user_id: users.sample.id,
  title: "Tour in Rio",
  description: "You will be picked by our local guide with a van to take you to all the places you need to see in Rio de Janeiro.",
  category: "Sightseeing",
  localization: "Rio de Janeiro",
  price_per_day: 100,
  image: "https://source.unsplash.com/random/?rio-de-janeiro"
)
activity = Activity.create(
  user_id: users.sample.id,
  title: "Desert tour",
  description: "nice escape from the hustle and bustle of Marrakech , it is a great chance to savor a Moroccan berber tea and admire magical views , hop on a camel and enjoy the breathtaking views of the desert and scenery of the Atlas Mountains in background.",
  category: "Tours",
  localization: "Marrakech",
  price_per_day: 130,
  image: "https://source.unsplash.com/random/?sahara-camel"
)
activities << activity
puts "Created activity in DB with id #{activity.id}"

5.times do |i|
  booking = Booking.create(
    user_id: users.sample.id,
    activity_id: activities.sample.id
  )
  puts "Created booking in DB with id #{booking.id}"
  bookings << booking
end

# Creates booking for demo user kaori
booking = Booking.create(
  time_start: Date.today - 2.days,
  time_end: Date.yesterday,
  user_id: lena.id,
  total_price: activity.price_per_day,
  activity_id: activity_lena.id
)

puts "Created past booking in DB with id #{booking.id}"

puts "Finished!"
