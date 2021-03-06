class Answer < ActiveRecord::Base
  validates :answer, null: false
  validates :user_id, presence: true
  validates :question_id, presence: true

  has_many :votes, :as => :votable
  has_many :comments, :as => :commentable
  belongs_to :question
  belongs_to :user
end
