require 'random_data'

# Create Users
5.times do
  User.create!(
  email:    RandomData.random_email,
  password: RandomData.random_sentence
  )
end
users = User.all

# Create Wikis
50.times do
  Wiki.create!(
    user:   users.sample,
    title:  RandomData.random_sentence,
    body:   RandomData.random_paragraph
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
