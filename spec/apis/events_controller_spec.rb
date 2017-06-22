require 'rails_helper'

# RSpec.describe EventsController, type: :controller do

#   let(:user) { User.create(email: "test@mail.com", password: "password", confirmed_at: Time.now) }
#   let(:registered_application) { RegisteredApplication.create(user_id: user.id, name: 'Name', url: 'url@url.com') }
#   let(:event) { Event.create(registered_application_id: registered_application.id, name: 'Name') }

#   before :each do 
#     sign_in user 
#   end
  
#   it "increases the number of RegisteredApplications by 1" do
#       expect{ post :create, registered_application_id: registered_application.id, evemt: {name: "Name"} }.to change(Event,:count).by(1)
#   end

