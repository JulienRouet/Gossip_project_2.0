class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :gossip
  has_many :sub_comments
  has_many :likes
end
