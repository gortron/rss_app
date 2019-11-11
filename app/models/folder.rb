class Folder < ActiveRecord::Base
  belongs_to :user
  has_many :feeds
  has_many :posts, through: :feeds
end