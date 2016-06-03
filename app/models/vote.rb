class Vote < ActiveRecord::Base
  # Remember to create a migration!
  validates :vote_value, presence: true

  belongs_to :user
  belongs_to :votable, :polymorphic => true
end
