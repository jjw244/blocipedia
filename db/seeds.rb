# Create Collaborators
2.times do
  Collaborator.create!(
    user_id: Faker::Number.unique.digit,
    wiki_id: Faker::Number.unique.digit,
    email: Faker::Internet.unique.email
  )
end
collaborators = Collaborator.all

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
  password: 'fakefakefake',
  role: 'premium'
)

user = User.second
user.update_attributes!(
  email: 'jennifer@heya.com',
  password: 'fakefakefake',
  role: 'standard'
)

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
puts "#{Collaborator.count} collaborators created"
