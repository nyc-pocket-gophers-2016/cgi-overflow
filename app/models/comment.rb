class Comment < ActiveRecord::Base
  # Remember to create a migration!
  has_many :votes, :as => :votable
  belongs_to :commentable, :polymorphic => true
  belongs_to :user
end
