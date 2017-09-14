puts "Destroying all previous generated models"
Upvote.destroy_all
ArticleTag.destroy_all
UserTag.destroy_all
Tag.destroy_all
Article.destroy_all
User.destroy_all

# User Generation
users_array = []
users_array << User.create!(title: "Financeur de startup",description: "à contacter pour toutes vos demande de financement",email: "florent@aquiti.fr", first_name: "florent".capitalize, invitation_accepted_at: DateTime.now, last_name: "merian".capitalize, password: "aquiti", company: "Aquiti", role: "super_admin")
users_array << User.create!(title: "Entrepreneur dans la santé",description: "serial entrepreneur, a pour ambition d'apporter des solutions ",email: "fouad@aquiti.fr", password: "aquiti", role: "super_admin", invitation_accepted_at: DateTime.now)
users_array << User.create!(title: "Expert de GIT mais pas de Github",description: "n'appelez pas si vous avez besoin de déployer sur heroku",email: "kos@aquiti.fr", password: "aquiti", role: "super_admin", invitation_accepted_at: DateTime.now)
users_array << User.create!(title: "Entrepreneur",description: "Le meilleur of course",email: "mathieu@aquiti.fr", password: "aquiti", role: "super_admin", invitation_accepted_at: DateTime.now)
users_array << User.create!(title: "Entrepreneur de la silicon vallée",description: "Expérience dans beaucoup de domaine",email: "en@test", password: "test", role: "entrepreneur", invitation_accepted_at: DateTime.now)
users_array << User.create!(title: "Investisseur, buisiness Angel",description: "$$$$$$",email: "in@test", password: "test", role: "investisseur", invitation_accepted_at: DateTime.now)
users_array << User.create!(title: "Expert en mécanique quantique",description: "vous comprendrez rien de toute façon",email: "ex@test", password: "test", role: "expert", invitation_accepted_at: DateTime.now)

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
