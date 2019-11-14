# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Folder.destroy_all
# Feed.destroy_all
# Post.destroy_all
# Bookmark.destroy_all
Folder.destroy_all
Feed.destroy_all
Post.destroy_all
Bookmark.destroy_all

user = User.create(name: 'test', username: 'testuser', email: 'testemail', password: 'test', paassword_confirmation: "test")
folder = Folder.create({name: 'Tech Blogs', user_id: user.id})
f1 = Feed.new
f2 = Feed.new
f3 = Feed.new
f1.build_from_url({'link' => 'https://www.engadget.com/rss.xml', 'folder_id' => folder.id})
f2.build_from_url({'link' => 'https://feeds.feedburner.com/TechCrunch/', 'folder_id' => folder.id})
f3.build_from_url({'link' => 'https://rss.nytimes.com/services/xml/rss/nyt/Technology.xml', 'folder_id' => folder.id})


