class User < ApplicationRecord
  has_many :posts
  has_many :comments

  validates :username, :password, :email, presence: true
  validates :username, :email, uniqueness: true
  validates :password, length: { in: 6..20 }
  validates :email, format: /.+@.+\.{1}.{2,}/
end
