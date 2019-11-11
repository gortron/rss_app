class User < ActiveRecord::Base
  has_many :folders
  has_many :feeds, through: :folders
  has_many :posts, through: :feeds
  has_many :bookmarks

  has_secure_password
end