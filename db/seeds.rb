# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

IMG = [
  "https://images.unsplash.com/photo-1593351415075-3bac9f45c877?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=871&q=80",
  "https://images.unsplash.com/photo-1605281317010-fe5ffe798166?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1144&q=80",
  "https://images.unsplash.com/photo-1528154291023-a6525fabe5b4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1064&q=80",
  "https://plus.unsplash.com/premium_photo-1675802755792-a7cfd346b5be?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1032&q=80",
  "https://images.unsplash.com/photo-1523496922380-91d5afba98a3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1032&q=80",
  "https://images.unsplash.com/photo-1599582350162-83106f579198?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80",
  "https://images.unsplash.com/photo-1621277224630-81d9af65e40c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80",
  "https://images.unsplash.com/photo-1564762861003-0aeb3c2e9b25?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1064&q=80",
  "https://plus.unsplash.com/premium_photo-1680831748352-3a6f45a3468e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=927&q=80",
  "https://images.unsplash.com/photo-1621114458838-4a15f1e7b214?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=987&q=80"
]

puts "Cleaning DB..."
User.destroy_all
Boat.destroy_all
Booking.destroy_all
puts "DB Clean"

puts "Populating DB..."

IMG.each do |img|
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
  # img = "https://loremflickr.com/320/240/yacht?#{name}"
  Boat.create!(name: name, brand: brand, engine: engine, year: year, capacity: capacity, cost: cost, pickup_address: address, user_id: user_id, img_url: img )
end

puts "Done!"
