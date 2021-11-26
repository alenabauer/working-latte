require "open-uri"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
CafeTag.destroy_all
Tag.destroy_all
Cafe.destroy_all
User.destroy_all

puts "Creating tags..."

pet_friendly = Tag.create(name: "pet friendly", description: "Pet-friendly, feel free to bring your furry friends!", icon:"fas fa-dog")
glutenfree = Tag.create(name: "gluten-free", description: "Gluten-free options available")
quiet = Tag.create(name: "quiet", description:"Cozy & quiet atmosphere", icon:"fas fa-volume-mute")
social = Tag.create(name: "social", description:"Chill atmosphere, great place for meetings and brainstorming sessions", icon:"fas fa-user-friends")
food = Tag.create(name: "food", description:"Food available on our menú, stay for lunch!", icon:"fas fa-utensils")
vegan = Tag.create(name: "vegan", description:"Vegan options available", icon:"fas fa-leaf")

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
cafe1_image1 = URI.open('https://images.unsplash.com/photo-1509042239860-f550ce710b93?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80.jpg')
cafe1_image2 = URI.open('https://images.unsplash.com/photo-1554118811-1e0d58224f24?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1147&q=80.jpg')
cafe2_image1 = URI.open('https://images.unsplash.com/photo-1493857671505-72967e2e2760?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80.jpg')
cafe2_image2 = URI.open('https://images.unsplash.com/photo-1453614512568-c4024d13c247?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1332&q=80.jpg')
cafe3_image1 = URI.open('https://images.unsplash.com/photo-1445116572660-236099ec97a0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80.jpg')
cafe3_image2 = URI.open('https://images.unsplash.com/photo-1432860560641-49d2a6156b81?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80.jpg')
cafe3_image3 = URI.open('https://images.unsplash.com/photo-1514066558159-fc8c737ef259?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80.jpg')
cafe4_image1 = URI.open('https://images.unsplash.com/photo-1522648485144-849409408aee?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80.jpg')
cafe5_image1 = URI.open('https://images.unsplash.com/photo-1608716349354-922a756b3455?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80.jpg')
cafe5_image2 = URI.open('https://images.unsplash.com/photo-1608716349384-9bdc855c03b5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80.jpg')
cafe6_image1 = URI.open('https://images.unsplash.com/photo-1627024195413-6465b719a08c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=388&q=80.jpg')
cafe7_image1 = URI.open('https://images.unsplash.com/photo-1617430690223-3e165b390e25?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=327&q=80.jpg')
cafe7_image2 = URI.open('https://images.unsplash.com/photo-1617430690220-45101953a208?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=327&q=80.jpg')
cafe8_image1 = URI.open('https://images.unsplash.com/photo-1615997588870-1bd56db506cc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=327&q=80.jpg')
cafe8_image2 = URI.open('https://images.unsplash.com/photo-1501747315-124a0eaca060?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80.jpg')
puts "Images loaded!"

puts "Creating cafes in Cologne..."

cafe1 = Cafe.create!({
  name: "Working Cave",
  address: "Moltkestr 88, Cologne",
  opening_hour: 9,
  closing_hour: 22,
  description: "The name of our cafe says it all, make it your working cave! It's all about remote workers here, you're more than welcome to bring your laptop and working kit, we'll take care of the coffee and all the energy you need to succeed!",
  user: users.sample
})

cafe1.photos.attach(io: cafe1_image1, filename: "#{cafe1.name}1.jpg", content_type: 'image/jpg')
cafe1.photos.attach(io: cafe1_image2, filename: "#{cafe1.name}2.jpg", content_type: 'image/jpg')

Chair.create!(cafe: cafe1)

cafe2 = Cafe.create!({
  name: "The Swing",
  address: "Sankt Apern Str 10, Cologne",
  opening_hour: 9,
  closing_hour: 22,
  description: "Have the best brunch in a chill atmosphere at The Swing. The modern atmosphere and cool decoration will leave you breathless",
  user: users.sample
})

cafe2.photos.attach(io: cafe2_image1, filename: "#{cafe2.name}1.jpg", content_type: 'image/jpg')
cafe2.photos.attach(io: cafe2_image2, filename: "#{cafe2.name}2.jpg", content_type: 'image/jpg')

Chair.create!(cafe: cafe2)

cafe3 = Cafe.create!({
  name: "Kaffeesaurus",
  address: "Friesenplatz, Cologne",
  opening_hour: 8,
  closing_hour: 21,
  description: "Chill coffee shop serving breakfast, baked goods & seasonal local fare, plus roasted coffee.",
  user: users.sample
})

cafe3.photos.attach(io: cafe3_image1, filename: "#{cafe3.name}1.jpg", content_type: 'image/jpg')
cafe3.photos.attach(io: cafe3_image2, filename: "#{cafe3.name}2.jpg", content_type: 'image/jpg')
cafe3.photos.attach(io: cafe3_image3, filename: "#{cafe3.name}3.jpg", content_type: 'image/jpg')

Chair.create!(cafe: cafe3)

cafe4 = Cafe.create!({
  name: "hommage Cafe",
  address: "Friesenstrasse 73, Cologne",
  opening_hour: 8,
  closing_hour: 18,
  description: "Down-to-earth spot with outdoor seating, offering pastries, breakfast & hand-roasted beans.",
  user: users.sample
})

cafe4.photos.attach(io: cafe4_image1, filename: "#{cafe4.name}1.jpg", content_type: 'image/jpg')

Chair.create!(cafe: cafe4)

cafe5 = Cafe.create!({
  name: "Cafe Riese Koln",
  address: "Schildergasse 103, Cologne",
  opening_hour: 9,
  closing_hour: 20,
  description: "Elaborate cakes, waffles & breakfasts, plus an ice cream counter, at a bright venue with a terrace.",
  user: users.sample
})

cafe5.photos.attach(io: cafe5_image1, filename: "#{cafe5.name}1.jpg", content_type: 'image/jpg')
cafe5.photos.attach(io: cafe5_image2, filename: "#{cafe5.name}2.jpg", content_type: 'image/jpg')

Chair.create!(cafe: cafe5)

cafe6 = Cafe.create!({
  name: "Kaffee & Kuchen",
  address: "Venloer Strasse 19, Cologne",
  opening_hour: 9,
  closing_hour: 17,
  description: "Quaint hangout serving breakfast, bagels, tapas & health-conscious bowls, plus smoothies & coffee.",
  user: users.sample
})

cafe6.photos.attach(io: cafe6_image1, filename: "#{cafe6.name}1.jpg", content_type: 'image/jpg')

Chair.create!(cafe: cafe6)

cafe7 = Cafe.create!({
  name: "THE COFFEE GANG",
  address: "Hohenstaufenring 19, Cologne",
  opening_hour: 8,
  closing_hour: 18,
  description: "Down-to-earth cafe offering coffee from fair trade beans, plus homemade cakes & sandwiches.",
  user: users.sample
})

cafe7.photos.attach(io: cafe7_image1, filename: "#{cafe7.name}1.jpg", content_type: 'image/jpg')
cafe7.photos.attach(io: cafe7_image2, filename: "#{cafe7.name}2.jpg", content_type: 'image/jpg')

Chair.create!(cafe: cafe7)

cafe8 = Cafe.create!({
  name: "Fassbender",
  address: "Obenmarspforten 7, Cologne",
  opening_hour: 10,
  closing_hour: 18,
  description: "Coffee & cakes served in a long-standing cafe with flowery decor, plus after-hours music & drinks.",
  user: users.sample
})

cafe8.photos.attach(io: cafe8_image1, filename: "#{cafe8.name}1.jpg", content_type: 'image/jpg')
cafe8.photos.attach(io: cafe8_image2, filename: "#{cafe8.name}2.jpg", content_type: 'image/jpg')

Chair.create!(cafe: cafe8)

puts "Cafes created!"

puts "Assigning tags to cafes..."

CafeTag.create(cafe: cafe1, tag: pet_friendly)
CafeTag.create(cafe: cafe1, tag: vegan)
CafeTag.create(cafe: cafe1, tag: social)
CafeTag.create(cafe: cafe2, tag: quiet)
CafeTag.create(cafe: cafe3, tag: social)
CafeTag.create(cafe: cafe3, tag: pet_friendly)
CafeTag.create(cafe: cafe3, tag: vegan)
CafeTag.create(cafe: cafe3, tag: pet_friendly)
CafeTag.create(cafe: cafe5, tag: vegan)
CafeTag.create(cafe: cafe5, tag: pet_friendly)
CafeTag.create(cafe: cafe6, tag: vegan)
CafeTag.create(cafe: cafe6, tag: social)
CafeTag.create(cafe: cafe7, tag: vegan)
CafeTag.create(cafe: cafe7, tag: pet_friendly)
CafeTag.create(cafe: cafe8, tag: pet_friendly)
CafeTag.create(cafe: cafe8, tag: food)

puts "All seeds set up!"
