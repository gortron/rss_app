class Feed < ActiveRecord::Base
  belongs_to :folder
  has_many :posts

  
  def self.create_from_url(args)
    url = args["link"]
    folder_id = args["folder_id"].to_i
    
    open(url) do |rss|
      feed = RSS::Parser.parse(rss)
      new_feed = Feed.create({
        title: feed.channel.title,
        link: feed.channel.link,
        description: feed.channel.description,
        #img_url: feed.image.url,
        folder_id: folder_id
      })

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
end