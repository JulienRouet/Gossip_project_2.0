class Gossip < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes
  has_many :tag_to_gossips
  has_many :tags, through: :tag_to_gossips
  validates :title, presence: true, length: { in: 3..14 }
  validates :content, presence: true
end
