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

puts "Creating tags..."

pet_friendly = Tag.create(name: "pet friendly")
glutenfree = Tag.create(name: "gluten-free")
quiet = Tag.create(name: "quiet")
social = Tag.create(name: "social")
food = Tag.create(name: "food")
vegan = Tag.create(name: "vegan")

puts "Tags created!"

puts "Creating Users..."
user_1 = User.create(email: "paula@garcia.com", password: "123456", first_name: "paula", last_name: "garcia")
user_2 = User.create(email: "emily@martinek.com", password: "123456", first_name: "emily", last_name: "martinek")
user_3 = User.create(email: "alena@bauer.com", password: "123456", first_name: "alena", last_name: "bauer")
user_4 = User.create(email: "constantin@beissel.com", password: "123456", first_name: "constantin", last_name: "beissel")
users = [user_1, user_2, user_3, user_4]

puts "WorkingLatte users created!"

puts "Creating cafes..."

puts "Creating images..."
cafe1_image2 = URI.open('https://images.unsplash.com/photo-1509042239860-f550ce710b93?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80.jpg')
cafe1_image = URI.open('https://images.unsplash.com/photo-1554118811-1e0d58224f24?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1147&q=80.jpg')
puts "Images loaded!"

puts "Creating cafes worldwide..."

cafe1 = Cafe.create!({
  name: "Jingle Bells",
  address: "Moscow, Russia",
  opening_hour: 8,
  closing_hour: 16,
  description: "The best place to be on a frosty winter day. Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
  user: users.sample
  })

  cafe1.photos.attach(io: cafe1_image, filename: "#{cafe1.name}1.jpg", content_type: 'image/jpg')
  cafe1.photos.attach(io: cafe1_image2, filename: "#{cafe1.name}2.jpg", content_type: 'image/jpg')


cafe2 = Cafe.create!({
  name: "Dominick the Donkey",
  address: "Rome, Italy",
  opening_hour: 12,
  closing_hour: 20,
  description: "A secret coffee place full of deers, music, and laughter. Pretty sure you'll want to come back (specially after tasing our hot chocolate with cookies).",
  user: users.sample
})

cafe3 = Cafe.create!({
  name: "Winter Wonderland",
  address: "Paris, France",
  opening_hour: 14,
  closing_hour: 23,
  description: "Come by and have a cup of our famous winter latte with whipped cream on top. Our carrot cake is a MUST! We're in downtown Paris, you won't believe the views!",
  user: users.sample
})

cafe4 = Cafe.create!({
  name: "Working Cave",
  address: "Moltkestr 88, Cologne",
  opening_hour: 9,
  closing_hour: 22,
  description: "The name of our cafe says it all, make it your working cave! It's all about remote workers here, you're more than welcome to bring your laptop and working kit, we'll take care of the coffee and all the energy you need to succeed!",
  user: users.sample
})

cafe5 = Cafe.create!({
  name: "The Swing",
  address: "Sankt Apern Str 10, Cologne",
  opening_hour: 9,
  closing_hour: 22,
  description: "Have the best brunch in a chill atmosphere at The Swing. The modern atmosphere and cool decoration will leave you breathless",
  user: users.sample
})

cafe6 = Cafe.create!({
  name: "Kaffeesaurus",
  address: "Friesenplatz, Cologne",
  opening_hour: 8,
  closing_hour: 21,
  description: "Chill coffee shop serving breakfast, baked goods & seasonal local fare, plus roasted coffee.",
  user: users.sample
})

cafe7 = Cafe.create!({
  name: "hommage Cafe",
  address: "Friesenstrasse 73, Cologne",
  opening_hour: 8,
  closing_hour: 18,
  description: "Down-to-earth spot with outdoor seating, offering pastries, breakfast & hand-roasted beans.",
  user: users.sample
})

cafe8 = Cafe.create!({
  name: "Cafe Riese Koln",
  address: "Schildergasse 103, Cologne",
  opening_hour: 9,
  closing_hour: 20,
  description: "Elaborate cakes, waffles & breakfasts, plus an ice cream counter, at a bright venue with a terrace.",
  user: users.sample
})

cafe9 = Cafe.create!({
  name: "Kaffee & Kuchen",
  address: "Venloer Strasse 19, Cologne",
  opening_hour: 9,
  closing_hour: 17,
  description: "Quaint hangout serving breakfast, bagels, tapas & health-conscious bowls, plus smoothies & coffee.",
  user: users.sample
})

cafe10 = Cafe.create!({
  name: "THE COFFEE GANG",
  address: "Hohenstaufenring 19, Cologne",
  opening_hour: 8,
  closing_hour: 18,
  description: "Down-to-earth cafe offering coffee from fair trade beans, plus homemade cakes & sandwiches.",
  user: users.sample
})

cafe11 = Cafe.create!({
  name: "Fassbender",
  address: "Obenmarspforten 7, Cologne",
  opening_hour: 10,
  closing_hour: 18,
  description: "Coffee & cakes served in a long-standing cafe with flowery decor, plus after-hours music & drinks.",
  user: users.sample
})

puts "Cates created! Your seeds are all set!"

CafeTag.create(cafe: cafe1, tag: pet_friendly)
CafeTag.create(cafe: cafe1, tag: vegan)
CafeTag.create(cafe: cafe1, tag: social)
CafeTag.create(cafe: cafe2, tag: glutenfree)
CafeTag.create(cafe: cafe2, tag: quiet)
CafeTag.create(cafe: cafe3, tag: social)
CafeTag.create(cafe: cafe3, tag: glutenfree)
CafeTag.create(cafe: cafe3, tag: vegan)
CafeTag.create(cafe: cafe3, tag: pet_friendly)
CafeTag.create(cafe: cafe4, tag: glutenfree)
CafeTag.create(cafe: cafe5, tag: vegan)
CafeTag.create(cafe: cafe5, tag: pet_friendly)
CafeTag.create(cafe: cafe6, tag: vegan)
CafeTag.create(cafe: cafe6, tag: social)
CafeTag.create(cafe: cafe7, tag: vegan)
CafeTag.create(cafe: cafe7, tag: pet_friendly)
CafeTag.create(cafe: cafe7, tag: glutenfree)
CafeTag.create(cafe: cafe8, tag: pet_friendly)
CafeTag.create(cafe: cafe8, tag: food)
CafeTag.create(cafe: cafe9, tag: pet_friendly)
CafeTag.create(cafe: cafe9, tag: food)
CafeTag.create(cafe: cafe10, tag: vegan)
CafeTag.create(cafe: cafe10, tag: food)
CafeTag.create(cafe: cafe11, tag: pet_friendly)
CafeTag.create(cafe: cafe11, tag: food)
CafeTag.create(cafe: cafe11, tag: glutenfree)
CafeTag.create(cafe: cafe11, tag: social)
