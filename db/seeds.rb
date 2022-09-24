# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "faker"
require "time"
puts "The following users exist: #{User.all}"

puts "Destroying existing data..."
User.destroy_all
puts "The following users exist: #{User.all}"
EventBooking.destroy_all
Message.destroy_all
Discussion.destroy_all
Event.destroy_all

puts "START: Generating seeds..."
themes = [
  "Outdoors",
  "Indoors",
  "Games",
  "Volunteering"
]

puts "Generating discussions"
8.times do
  # Create discussion
  discussion = Discussion.new(title: Faker::Hobby.activity)
  discussion.save!
end

# puts "Generating users..."
# # Define first user number
# i = 1
# 20.times do
#   # Create user
#   user = User.new(
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     email: Faker::Internet.email,
#     password: "123123"
#   )
#   puts user.first_name
#   user.save!

#   puts "Generating messages for user #{i}"
#   random_message_number = rand(1..10)
#   random_message_number.times do
#     # Create message for a user
#     message = Message.new(
#       content: Faker::Lorem.sentence,
#       user: user,
#       discussion: Discussion.all.sample
#     )
#     message.save!
#   end

#   puts "Generating events for user #{i}"
#   random_event_number = rand(1..5)
#   random_event_number.times do
#     # Create event for a user
#     event = Event.new(
#       title: Faker::Movie.title,
#       date: Faker::Date.between(from: '2022-09-23', to: '2023-09-25'),
#       time: Time.now,
#       theme: themes.sample,
#       price: rand(0..10),
#       summary: Faker::Lorem.sentence,
#       description: Faker::Lorem.paragraph,
#       location: Faker::TvShows::StarTrek.location,
#       user: user
#     )
#     event.save!
#   end

#   puts "Generating event bookings for user #{i}"
#   # random_booking_number = rand(1..5)
#   events_where_not_creator = Event.where.not(id: user.id)
#   events_where_not_creator.each do |event|
#     # Create booking for user onto each event once (if not their own event)
#     event_booking = EventBooking.new(event: event, user: user)
#     event_booking.save!
#   end

#   # Increment user number
#   i += 1
# end

puts "END: Seeds generated."
puts "The following users exist: #{User.all}"
