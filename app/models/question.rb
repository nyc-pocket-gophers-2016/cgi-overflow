class Question < ActiveRecord::Base
  # Remember to create a migration!
  has_many :answers
  has_many :votes, :as => :votable
  has_many :comments, :as=> :commentable
  belongs_to :user

  validates :title, :question, presence: true
end
