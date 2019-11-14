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
FolderFeed.destroy_all
Bookmark.destroy_all

user = User.find(11)
user2 = User.all.last

folder = Folder.create({name: 'My Tech Blogs', user_id: user.id})
folder2 = Folder.create({name: 'Also My Tech Blogs', user_id: user2.id})
folder.add_feed('https://www.engadget.com/rss.xml')
folder.add_feed('https://feeds.feedburner.com/TechCrunch/')
folder.add_feed('https://rss.nytimes.com/services/xml/rss/nyt/Technology.xml')

folder2.add_feed('https://rss.nytimes.com/services/xml/rss/nyt/Technology.xml')

# FolderFeed.create(folder_id: folder.id, feed_id: f1.id)
# FolderFeed.create(folder_id: folder.id, feed_id: f2.id)
# FolderFeed.create(folder_id: folder.id, feed_id: f3.id)
# FolderFeed.create(folder_id: folder.id, feed_id: f3.id)


