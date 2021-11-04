class User < ApplicationRecord
  belongs_to :city
  has_many :comments
  has_many :sub_comments
  has_many :likes
  has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
  has_many :receivers
  has_many :gossips
end
