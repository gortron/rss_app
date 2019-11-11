class Feed < ActiveRecord::Base
  belongs_to :folder
  belongs_to :user
  has_many :posts
end