require 'rails_helper'

RSpec.describe Event, type: :model do
    
   let(:user) {User.create(email: "test@mail.com", password: "password", confirmed_at: Time.now) }
   let(:registered_application) {RegisteredApplication.create(user_id: user.id, name: 'Name', url: 'url@url.com') }
   
   3.times do
      let(:event) {Event.create(name: "Big Bang", registered_application_id: registered_application.id)} 
   end
   
   it { is_expected.to belong_to(:registered_application) }
   
   describe "attributes" do
     it "has a name and registered_application attributes" do
       expect(event).to have_attributes(registered_application_id: registered_application.id, name: event.name)
     end
   end
  
end
