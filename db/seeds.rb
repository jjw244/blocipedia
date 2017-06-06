# Create Users
3.times do
  User.create!(
    email: Faker::Internet.unique.email,
    password: Faker::Internet.unique.password
  )
end
users = User.all

# Create Wikis
10.times do
  Wiki.create!(
    user: users.sample,
    title: Faker::Name.title,
    body: Faker::Lorem.paragraph
  )
end
wikis = Wiki.all

user = User.first
user.update_attributes!(
  email: 'jjw244@utexas.edu',
  password: 'fakefakefake',
  role: 'premium'
)

user = User.second
user.update_attributes!(
  email: 'jennifer@heya.com',
  password: 'fakefakefake',
  role: 'standard'
)

user = User.third
user.update_attributes!(
  email: 'jenni@bear.com',
  password: 'fakefakefake',
  role: 'admin'
)

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
