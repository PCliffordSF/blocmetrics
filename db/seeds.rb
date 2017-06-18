# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



 # Create Registered Applications
 
 5.times do
      
   User.create!(
    password:  Faker::StarWars.quote,
    email:   Faker::Internet.email
   )
   
 end
   
 users = User.all
 
 10.times do
  
   user = users.sample
   user_id = user.id
   
   RegisteredApplication.create!(
    name:  Faker::StarWars.vehicle,
    url:   Faker::Internet.url,
    user_id: user_id
   )
   
 end
 
 registered_applications = RegisteredApplication.all
 
 500.times do
  
   registered_application = registered_applications.sample
   registered_application_id = registered_application.id
      
   Event.create!(
     name: Faker::Pokemon.name,
     registered_application_id: registered_application_id
   )
    
 end
 
 puts "Seed finished"
 puts "#{User.count} users created"
 puts "#{RegisteredApplication.count} comments created"
 puts "#{Event.count} events created"
