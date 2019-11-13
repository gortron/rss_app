class AddRssLinkToFeeds < ActiveRecord::Migration[6.0]
  def change
    add_column :feeds, :rss_link, :string
  end
end
