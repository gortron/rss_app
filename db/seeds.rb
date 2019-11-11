# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Folder.destroy_all
Feed.destroy_all
Post.destroy_all
Bookmark.destroy_all

folder = Folder.create({name: 'Tech Blogs', user_id: 11})

url = 'https://www.engadget.com/rss.xml'
open(url) do |rss|
  feed = RSS::Parser.parse(rss)
  our_feed = Feed.create({
    title: feed.channel.title,
    link: feed.channel.link,
    description: feed.channel.description,
    img_url: feed.image.url,
    folder_id: folder.id
  })
  #puts "Title: #{feed.channel.title}"
  feed.items.each do |post|
    Post.create({
      title: post.title,
      link: post.link,
      description: post.description,
      author_name: post.dc_creator,
      published_time: post.pubDate,
      feed_id: our_feed.id
    })
    #puts "Item: #{item.title}"
  end
end