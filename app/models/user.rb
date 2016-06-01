class User < ActiveRecord::Base

  validates :first_name, :last_name, :password, presence: true, length: { maximum: 1 }
  validates :username, :email, presence: true, uniqueness: true, length: { maximum: 1 }

  has_many :questions
  has_many :answers
  has_many :comments
  has_many :votes

  has_secure_password

end
