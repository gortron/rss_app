class Feed < ActiveRecord::Base
  has_many :folder_feeds
  has_many :posts
  validates :rss_link, uniqueness: true

  def build_from_url(rss_link)
    @rss_link = rss_link
    open(@rss_link) do |rss|
      @feed = RSS::Parser.parse(rss)
      @built_feed = build_feed_from_rss
      @feed.items.each do |post|
        Post.create({
          title: post.title,
          link: post.link,
          description: post.description,
          author_name: post.dc_creator,
          published_time: post.pubDate,
          feed_id: @built_feed.id
        })
      end
    end
    @built_feed
  end

  def build_feed_from_rss
    feed_title = format_channel_title(@feed.channel.title)
    Feed.create({
      title: feed_title,
      link: @feed.channel.link,
      rss_link: @rss_link,
      description: @feed.channel.description,
      #img_url: feed.image.url,
    })
  end

  def format_channel_title(title)
    title = title.split(/[\s.:]/)
    #title = title.split
    title.delete_if {|bit| bit == "RSS" || bit == "Feed" || bit == "com" || bit == ""}
    title.join(' ')
  end

  def refresh
    rss_link = self.rss_link
    open(rss_link) do |rss|
      feed = RSS::Parser.parse(rss)
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
end