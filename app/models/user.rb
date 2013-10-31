class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :posts
  validates :email, :presence => true
  validates :password, :presence => true

   validates :email, uniqueness: true
end
