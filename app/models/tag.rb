class Tag < ApplicationRecord
  has_many :tag_to_gossips
  has_many :gossips, through: :tag_to_gossips
end
