class Post < ActiveRecord::Base
  belongs_to :feed
  has_many :bookmarks
  validates :link, uniqueness: true

end