class Answer < ActiveRecord::Base
  has_many :votes, :as => :votable
  has_many :comments, :as => :commentable
  belongs_to :question
  belongs_to :user

  validates :answer, null: false
  validates :user_id, presence: true
  validates :question_id, presence: true
end
