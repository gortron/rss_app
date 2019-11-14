class CreateFolderFeeds < ActiveRecord::Migration[6.0]
  def change
    create_table :folder_feeds do |t|
      t.integer :folder_id
      t.integer :feed_id
      t.timestamps
    end
  end
end
