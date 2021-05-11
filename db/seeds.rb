# Spring Cleaning Day
Post.destroy_all
User.destroy_all


User.create! username: "Marco", email: "marco@test.com", password: "123456", github_username: "marcoranieri"
User.create! username: "Ife",   email: "ife@test.com", password: "123456", github_username: "ifeodugbesan"
User.create! username: "Ben",   email: "ben@test.com", password: "123456", github_username: "fanninggg"
User.create! username: "Phelim",   email: "phelim@test.com", password: "123456", github_username: "pdunleav"


# Create USERS
10.times do |i|
  User.create! username: Faker::Movies::HarryPotter.character,   email: "test#{i*10}@test.com", password: "123456"
end


# Create POST
10.times do |i|
  Post.create! user: User.all.sample,
  title: [Faker::Movies::HarryPotter.location, Faker::Movies::HarryPotter.book].sample,
  body: Faker::Movies::HarryPotter.quote
end


puts "User created (#{User.count})"
puts "Post created (#{Post.count})"