require 'rails_helper'

RSpec.describe RegisteredApplication, type: :model do
    
   let(:user) {User.create(email: "test@mail.com", password: "password", confirmed_at: Time.now) }
   let(:registered_application) {RegisteredApplication.create(user_id: user.id, name: 'Name', url: 'url@url.com') }
   
   3.times do
      let(:event) {Event.create(name: "Big Bang", registered_application_id: registered_application.id)} 
   end
   
   it { is_expected.to belong_to(:user) }
   
   it { should have_many(:events) }
   
   describe "attributes" do
     it "has a name, rul, and user attribute" do
       expect(registered_application).to have_attributes(user_id: user.id, name: registered_application.name, url: registered_application.url)
     end
   end
   
end
