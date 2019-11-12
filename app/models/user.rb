class User < ActiveRecord::Base
  has_many :folders
  has_many :feeds, through: :folders
  has_many :posts, through: :feeds
  has_many :bookmarks
  validates :username, uniqueness: true
  validates :email, uniqueness: true

  has_secure_password
end