class User < ActiveRecord::Base
  has_many :folders
  has_many :folder_feeds, through: :folders
  has_many :feeds, through: :folders
  has_many :posts, through: :feeds
  has_many :bookmarks

  # Validations

  validates :name, length: { minimum: 5 }
  validates :name, format: { with: /\s/, message: "should be your first and last names"}
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :email, uniqueness: true
  validates :username, presence: true
  validates :username, uniqueness: true
  validates :username, format: { without: /\s/, message: "Username must contain no spaces" }
  validates :password, length: { minimum: 8 }
  has_secure_password

  

  #flash[:errors] = person.errors.full_messages.to_sentence
end