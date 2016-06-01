class Comment < ActiveRecord::Base
  # Remember to create a migration!
  validates :comment, presence: true

  has_many :votes, as: :votable
  belongs_to :commentable, polymorphic: true
  belongs_to :user
end
