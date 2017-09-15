puts "Destroying all previous generated models"
Upvote.destroy_all
Tag.destroy_all
Article.destroy_all
User.destroy_all
Contact.destroy_all

# User Generation
users_array = []
users_array << User.create!(email: "florent@aquiti.fr",password: "aquiti", role: "super_admin", invitation_accepted_at: DateTime.now)
users_array << User.create!(email: "fouad@aquiti.fr", password: "aquiti", role: "super_admin", invitation_accepted_at: DateTime.now)
users_array << User.create!(email: "kos@aquiti.fr", password: "aquiti", role: "super_admin", invitation_accepted_at: DateTime.now)
users_array << User.create!(email: "mathieu@aquiti.fr", password: "aquiti", role: "super_admin", invitation_accepted_at: DateTime.now)
users_array << User.create!(email: "en@test", password: "test", role: "entrepreneur", invitation_accepted_at: DateTime.now)
users_array << User.create!(email: "in@test", password: "test", role: "investisseur", invitation_accepted_at: DateTime.now)
users_array << User.create!(email: "ex@test", password: "test", role: "expert", invitation_accepted_at: DateTime.now)

puts "Users created"

articles_array = []
rand(20..30).times do
  articles_array << Article.create!(title: Faker::Name.title, description: Faker::Lorem.sentence(25, false, 0), url: Faker::Internet.url, permalink: "#", user: users_array.sample)
end

puts "Articles created"

# Tags for the articles
list_tags = %w(Building Hiring Funding Growing)
tags_array = []
list_tags.each do |tag|
  tags_array << Tag.create!(name: tag)
end

puts "Tags for articles created"

# Link articles & tags
articles_array.each do |article|
  article.tags << tags_array.sample
end

puts "Tags linked to articles"

# Upvote Generation
rand(50..60).times do
  Upvote.create!(article: articles_array.sample, user: users_array.sample)
end

puts "Upvotes done"

#Contacts generation
10.times do
  c = Contact.create(title: Faker::Job.title, description: Faker::Lorem.sentence(3))
  2.times do
    c.tags << tags_array.sample
  end
end

puts "Contact done"
