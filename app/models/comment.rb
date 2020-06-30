class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_many :comments

  validates :content, presence: true
end
