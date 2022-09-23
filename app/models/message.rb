class Message < ApplicationRecord
  belongs_to :user
  belongs_to :discussion

  validates :content, presence: true
  validates :content, length: { maximum: 500 }
end
