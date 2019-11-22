User.create!(name: "Rodolfo Cisneros",
  email: "brsrkdev@gmail.com",
  password: "123456"
)


4.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
    email: email,
    password: password)
end

users = User.order(:created_at).take(5)
5.times do
  content = Faker::Lorem.sentence(word_count: 25)
  users.each { |user| user.posts.create!(content: content) }
end