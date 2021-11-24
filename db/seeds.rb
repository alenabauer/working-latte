require "open-uri"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Cafe.destroy_all
User.destroy_all

TAGS = [ "vegan", "pet friendly", "gluten-free", "quiet", "social", "food", "alcohol" ]

puts "Creating Santa..."
santa = User.new({ first_name: "Santa", last_name: "Claus", is_cafe_owner: true, email: "santa@claus.com", password: "santaclaus" })
santa.save!

puts "Creating cafes..."
cafe1_image2 = URI.open('https://images.unsplash.com/photo-1509042239860-f550ce710b93?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80.jpg')
cafe1_image = URI.open('https://images.unsplash.com/photo-1554118811-1e0d58224f24?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1147&q=80.jpg')
cafe1 = Cafe.create!({
  name: "Jingle Bells",
  address: "Moscow, Russia",
  opening_hour: 8,
  closing_hour: 16,
  description: "The best place to be on a frosty winter day. Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
  user: santa
  })
  cafe1.photos.attach(io: cafe1_image, filename: "#{cafe1.name}1.jpg", content_type: 'image/jpg')
  cafe1.photos.attach(io: cafe1_image2, filename: "#{cafe1.name}2.jpg", content_type: 'image/jpg')


cafe2 = Cafe.create!({
  name: "Dominick the Donkey",
  address: "Rome, Italy",
  opening_hour: 12,
  closing_hour: 20,
  description: "A secret coffee place full of deers, music, and laughter. Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
  user: santa
})

cafe3 = Cafe.create!({
  name: "Winter Wonderland",
  address: "Paris, France",
  opening_hour: 14,
  closing_hour: 23,
  description: "Come by and have a cup of our famous winter latte. Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
  user: santa
})
