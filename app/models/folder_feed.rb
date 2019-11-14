class FolderFeed < ActiveRecord::Base
  belongs_to :folder
  belongs_to :feed
end