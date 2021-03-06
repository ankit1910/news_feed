class Comment < ActiveRecord::Base

  #Associations
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_many :replies, class_name: 'Comment', as: :commentable, dependent: :destroy

  #Validations
  validates :title, presence: true
end
