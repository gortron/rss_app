class RemoveFolderIdFromFeeds < ActiveRecord::Migration[6.0]
  def change
    remove_column :feeds, :folder_id
  end
end
