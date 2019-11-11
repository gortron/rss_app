class Feed < ActiveRecord::Base
  belongs_to :folder
  has_many :posts
end