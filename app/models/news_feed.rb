class NewsFeed < ActiveRecord::Base

  #Associations
  has_many :comments, as: :commentable, dependent: :destroy

  #Validations
  validates :title, :link, :description, :published_at, :guid, presence: true
  validates :guid, uniqueness: true
end
