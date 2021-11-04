class PrivateMessage < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  has_many :receivers
  has_many :user, through: :receivers
end
