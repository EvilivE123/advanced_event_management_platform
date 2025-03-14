# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

#^ User Roles
user_role = ConfigurationSetting.find_or_initialize_by(name: 'user_roles', value: ['admin','organizer', 'attendee'])
user_role.save!

#^ Event Types
event_types = ConfigurationSetting.find_or_initialize_by(name: 'event_types', value: ['conference', 'workshop', 'meetup', 'standup_comedy', 'music_festival'])
event_types.save!

#^ Ticket Types
event_types = ConfigurationSetting.find_or_initialize_by(name: 'ticket_types', value: ['early_bird', 'regular', 'vip'])
event_types.save!

#^ Create Admin
admin = User.find_or_initialize_by(
  name:'Admin',
  email:'admin@yopmail.com', 
  role: 'admin'
)
admin.password = 'admin'
admin.save!

#^ Create Organizer
organizer = User.find_or_initialize_by(
  name:'Mumbai Sports Club',
  email:'mumbai_sports_club@yopmail.com', 
  role: 'organizer'
)
organizer.password = 'mumbai_sports_club'
organizer.save!

#^ Create Attendee
attendee = User.find_or_initialize_by(
  name:'John Doe',
  email:'john_doe@yopmail.com',
  role: 'attendee'
)
attendee.password = 'john_doe'
attendee.save!