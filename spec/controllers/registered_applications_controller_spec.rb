require 'rails_helper'

RSpec.describe RegisteredApplicationsController, type: :controller do

  let(:user) {User.create(email: "test@mail.com", password: "password", confirmed_at: Time.now) }
  let(:registered_application) {RegisteredApplication.create(user_id: user.id, name: 'Name', url: 'url@url.com') }

  # before :each do 
  #   sign_in user 
  # end
  
  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "increases the number of RegisteredApplications by 1" do
      expect{ post :create, user_id: user.id, registered_application: {name: "Name", url: "me@me.com"} }.to change(RegisteredApplication,:count).by(1)
    end
  end




  describe "DELETE #destroy" do
    it "returns http success" do
      delete :destroy, user_id: user.id, id: registered_application.id 
      count = RegisteredApplication.where({id: registered_application.id}).size
      expect(count).to eq 0
    end
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, id: registered_application.id
      expect(response).to have_http_status(:success)
    end
  end
end
