# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

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
  capacity = Faker::Vehicle.engine
  cost = rand(80..190)
  address = Faker::Address.street_address
  user_id = user.id
  Boat.create(name: name, brand: brand, engine: engine, year: year, capacity: capacity, cost: cost, pickup_address: address, user_id: user_id )
end
