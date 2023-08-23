# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all
Boat.destroy_all
Booking.destroy_all

10.times do
  # User generation
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = Faker::Internet.email
  password = Faker::Internet.password
  User.create(first_name: first_name, last_name: last_name, email: email, password: password)
  user = User.last

  # Boat generation
  name = Faker::FunnyName.name
  brand = Faker::Company.name
  engine = Faker::Vehicle.version
  year = Faker::Vehicle.year
  capacity = rand(1..5)
  cost = rand(80..190)
  address = Faker::Address.street_address
  user_id = user.id
  img = Faker::LoremFlickr.image(search_terms: ['boat'])

  Boat.create!(name: name, brand: brand, engine: engine, year: year, capacity: capacity, cost: cost, pickup_address: address, user_id: user_id, img_url: img )
end
