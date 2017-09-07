puts "Destroying all previous generated models"
Upvote.destroy_all
ArticleTag.destroy_all
UserTag.destroy_all
Tag.destroy_all
Article.destroy_all
User.destroy_all

# User Generation
florent = User.create!(email: "florent@aquiti.fr", first_name: "florent".capitalize, last_name: "merian".capitalize, password: "aquiti", company: "Aquiti", role: "admin")
fouad = User.create!(email: "fouad@aquiti.fr", password: "aquiti", role: "admin")
kos = User.create!(email: "kos@aquiti.fr", password: "aquiti", role: "admin")
mathieu = User.create!(email: "mathieu@aquiti.fr", password: "aquiti", role: "admin")
testEntrepreneur = User.create!(email: "en@test", password: "test", role: "entrepreneur")
testInvestissor = User.create!(email: "in@test", password: "test", role: "investisseur")
testExpert = User.create!(email: "ex@test", password: "test", role: "expert")

puts "Users created"

# Article Generation
Article.create!(title: "4G : des déploiements au ralenti en août, particulièrement en outre-mer",
              description: "En août, le rythme des déploiements de la 4G était globalement plus calme qu'en juillet, tout particulièrement en outre-mer où seul SRR a densifié son réseau. En métropole, Bouygues Telecom est bon dernier, tandis que les trois autres se tiennent dans un mouchoir de poche.",
              url: "https://www.nextinpact.com/news/105111-4g-deploiements-au-ralenti-en-aout-particulierement-en-outre-mer.htm",
              permalink: "#",
              user: fouad)

Article.create!(title: "Connexions chiffrées : l'âge des protocoles VPN en question",
              description: "Après plus d'une décennie de bons et loyaux services, OpenVPN serait en passe de trouver un remplaçant avec WireGuard. Son concepteur, Jason Donenfeld, estime que l'outil actuel est trop ancien et lourd pour être sûr. Plusieurs services VPN nous répondent avec leurs projets, dont une réécriture du serveur OpenVPN en Rust.",
              url: "https://www.nextinpact.com/news/105081-connexions-chiffrees-age-protocoles-vpn-en-question.htm",
              permalink: "#",
              user: kos)

Article.create!(title: "Du changement chez YouTube : logo, design et applications mobiles",
              description: "Google vient de dévoiler un nouveau logo pour YouTube, une première depuis 2005, et annonce au passage plusieurs petits changements, sans pour autant être une révolution. La vitesse de lecture variable débarque sur mobile et Material Design sur l'application web. ",
              url: "https://www.nextinpact.com/news/105050-du-changement-chez-youtube-logo-design-et-applications-mobiles.htm",
              permalink: "#",
              user: mathieu)

puts "Articles created"

# Tags for the articles
Tag.create!(name: "Building")
Tag.create!(name: "Hiring")
Tag.create!(name: "Funding")
Tag.create!(name: "Growing")

puts "Tags for articles created"

# Link articles & tags
ArticleTag.create!(article: Article.first, tag: Tag.limit(5).first)
ArticleTag.create!(article: Article.second, tag: Tag.third)
ArticleTag.create!(article: Article.third, tag: Tag.third)

# Link users & tags
UserTag.create!(tag: Tag.first, user: florent)
UserTag.create!(tag: Tag.third, user: florent)
UserTag.create!(tag: Tag.third, user: kos)
UserTag.create!(tag: Tag.fourth, user: fouad)
UserTag.create!(tag: Tag.all[6], user: mathieu)

puts "Tags linked to articles and users"

# Upvote Generation
Upvote.create!(upvotable: Article.second, user: mathieu)
Upvote.create!(upvotable: Article.first, user: kos)
Upvote.create!(upvotable: Article.second, user: kos)
Upvote.create!(upvotable: Article.first, user: fouad)
Upvote.create!(upvotable: Article.third, user: fouad)

# print all the upvoted articles by fouad
# upvotes.where(user: f)

puts "Upvotes done"
