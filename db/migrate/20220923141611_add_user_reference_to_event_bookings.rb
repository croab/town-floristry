class AddUserReferenceToEventBookings < ActiveRecord::Migration[7.0]
  def change
    add_reference :event_bookings, :user, foreign_key: true
  end
end
