class Folder < ActiveRecord::Base
  belongs_to :user
  has_many :feeds
  has_many :posts, through: :feeds
  #validates :feeds, uniqueness: true
   # validating feeds doesn't work

  def refresh_feeds
    self.feeds.each do |feed|
      feed.refresh
    end
  end
end