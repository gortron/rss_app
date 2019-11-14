class Folder < ActiveRecord::Base
  belongs_to :user
  has_many :folder_feeds
  has_many :feeds, through: :folder_feeds
  has_many :posts, through: :feeds

  def add_feed(rss_link)
    feed = Feed.find_by(rss_link: rss_link)
    if feed
      FolderFeed.create(folder_id: self.id, feed_id: feed.id)
    else
      feed = Feed.new
      feed = feed.build_from_url(rss_link)
      ff = FolderFeed.create(folder_id: self.id, feed_id: feed.id)
    end
  end

  def refresh_feeds
    self.feeds.each do |feed|
      feed.refresh
    end
  end
end