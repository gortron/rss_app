class Feed < ActiveRecord::Base
  belongs_to :folder
  belongs_to :user
  has_many :posts

  def self.create_from_url(url, folder)
    open(url) do |rss|
    feed = RSS::Parser.parse(rss)
    new_feed = self.create({
      title: feed.channel.title,
      link: feed.channel.link,
      description: feed.channel.description,
      img_url: feed.image.url,
      folder_id: folder.id
    })
    Post.create_from_feed(feed)
    end
  end

  def create_from_feed(feed)
    feed.items.each do |post|
      Post.create({
        title: post.title,
        link: post.link,
        description: post.description,
        author_name: post.dc_creator,
        published_time: post.pubDate,
        feed_id: new_feed.id
      })
    end
  end
end