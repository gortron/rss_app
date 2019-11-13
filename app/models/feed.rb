class Feed < ActiveRecord::Base
  belongs_to :folder
  has_many :posts

  def format_channel_title(title)
    title = title.split(/[\s.]/)
    #title = title.split
    title.delete_if {|bit| bit == "RSS" || bit == "Feed" || bit == "com" }
    title.join(' ')
  end

  def refresh
    rss_link = self.rss_link
    open(rss_link) do |rss|
      feed = RSS::Parser.parse(rss)
      # feed_title = format_channel_title(feed.channel.title)
      # refreshed_feed = Feed.update({
      #   title: feed_title,
      #   link: feed.channel.link,
      #   description: feed.channel.description
      #   #img_url: feed.image.url
      #   })[0]
      #   byebug
      feed.items.each do |post|
        Post.create({
          title: post.title,
          link: post.link,
          description: post.description,
          author_name: post.dc_creator,
          published_time: post.pubDate,
          feed_id: self.id
        })
      end
    end
  end

  def build_from_url(args)
    rss_link = args["link"]
    folder_id = args["folder_id"].to_i
    
    open(rss_link) do |rss|
      feed = RSS::Parser.parse(rss)
      feed_title = format_channel_title(feed.channel.title)
      new_feed = Feed.create({
        title: feed_title,
        link: feed.channel.link,
        rss_link: rss_link,
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