class Bookmark < ActiveRecord::Base
  belongs_to :user
  belongs_to :post # or does it has_one :post?
end