puts "Destroying all previous generated models"
Upvote.destroy_all
ArticleTag.destroy_all
UserTag.destroy_all
Tag.destroy_all
Article.destroy_all
User.destroy_all

# User Generation
users_array = []
users_array << User.create!(email: "florent@aquiti.fr", first_name: "florent".capitalize, last_name: "merian".capitalize, password: "aquiti", company: "Aquiti", role: "super_admin")
users_array << User.create!(email: "fouad@aquiti.fr", password: "aquiti", role: "super_admin")
users_array << User.create!(email: "kos@aquiti.fr", password: "aquiti", role: "super_admin")
users_array << User.create!(email: "mathieu@aquiti.fr", password: "aquiti", role: "super_admin")
users_array << User.create!(email: "en@test", password: "test", role: "entrepreneur")
users_array << User.create!(email: "in@test", password: "test", role: "investisseur")
users_array << User.create!(email: "ex@test", password: "test", role: "expert")

puts "Users created"

articles_array = []
rand(20..30).times do
  articles_array << Article.create!(title: Faker::Name.title, description: Faker::Lorem.sentence(48), url: Faker::Internet.url, permalink: "#", user: users_array.sample)
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
  ArticleTag.create!(article: article, tag: tags_array.sample)
end

# Link users & tags
rand(8..12).times do
  UserTag.create!(tag: tags_array.sample, user: users_array.sample)
end

puts "Tags linked to articles and users"

# Upvote Generation
rand(50..60).times do
  Upvote.create!(upvotable: articles_array.sample, user: users_array.sample)
end

puts "Upvotes done"
