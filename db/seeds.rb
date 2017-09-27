puts "Destroying all previous generated models"
Upvote.destroy_all
Tag.destroy_all
Article.destroy_all
User.destroy_all
Contact.destroy_all

# User Generation
users_array = []
users_array << User.create!(email: "florent.merian@aquiti.fr",password: "aquiti", role: "super_admin", invitation_accepted_at: DateTime.now)
users_array << User.create!(email: "entrepreneur@test.fr", password: "aquiti", role: "entrepreneur", invitation_accepted_at: DateTime.now)

puts "Users created"

# Tags for the articles
list_tags = %w(Building Hiring Funding Growing)
tags_array = []
list_tags.each do |tag|
  tags_array << Tag.create!(name: tag)
end
puts "Tags for articles created"

articles_array = []
rand(20..30).times do
  a = Article.new(title: Faker::Name.title, description: Faker::Lorem.sentence(5, true, 15), url: Faker::Internet.url, permalink: "#", user: users_array.sample)
  a.tags << tags_array.sample
  a.save
  articles_array << a
end


puts "Articles created"


# Upvote Generation
rand(50..60).times do
  Upvote.create!(article: articles_array.sample, user: users_array.sample)
end

puts "Upvotes done"

#Contacts generation
51.times do
  c = Contact.new(title: Faker::Job.title, description: Faker::Lorem.sentence(12, false, 0))
  c.tags << tags_array.sample
  c.save
end

puts "Contact done"
