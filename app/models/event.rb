class Event < ApplicationRecord
  belongs_to :user
  has_many :event_bookings, dependent: :destroy

  validates :title, :date, :time, :theme, :price, :summary, :description, :location, presence: true
end
