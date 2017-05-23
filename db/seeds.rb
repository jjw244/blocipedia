# Create Users
5.times do
  User.create!(
    email: Faker::Internet.unique.email,
    password: Faker::Internet.unique.password
  )
end
users = User.all

# Create Wikis
50.times do
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
  password: 'fakefakefake'
)

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
