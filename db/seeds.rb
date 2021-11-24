# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
<<<<<<< HEAD

=======
TAGS = [ "vegan", "pet friendly", "gluten-free", "quiet", "social", "food", "alcohol" ]
>>>>>>> master

puts "Creating Santa..."
santa = User.new({ first_name: "Santa", last_name: "Claus", is_cafe_owner: true, email: "santa@claus.com", password: "santaclaus" })
santa.save!

puts "Creating cafes..."
Cafe.create!({
  name: "Jingle Bells",
  address: "Moscow, Russia",
  opening_hour: 8,
  closing_hour: 16,
  description: "The best place to be on a frosty winter day. Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
  user: santa
})
Cafe.create!({
  name: "Dominick the Donkey",
  address: "Rome, Italy",
  opening_hour: 12,
  closing_hour: 20,
  description: "A secret coffee place full of deers, music, and laughter. Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
  user: santa
})
Cafe.create!({
  name: "Winter Wonderland",
  address: "Paris, France",
  opening_hour: 14,
  closing_hour: 23,
  description: "Come by and have a cup of our famous winter latte. Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
  user: santa
})
