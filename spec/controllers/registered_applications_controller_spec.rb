require 'rails_helper'

RSpec.describe RegisteredApplicationsController, type: :controller do

  let(:user) {User.create(email: "test@mail.com", password: "password", confirmed_at: Time.now) }
  let(:registered_application) {RegisteredApplication.create(user_id: user.id, name: 'Name', url: 'url@url.com') }

  before :each do 
    sign_in user 
  end
  
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
  end
  
  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
    
   it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end
    
    it "instantiates @registered_application" do
      get :new
      expect(assigns(:registered_application)).not_to be_nil
    end
  end

  describe "POST #create" do
    
    it "increases the number of RegisteredApplications by 1" do
      expect{ post :create, user_id: user.id, registered_application: {name: "Name", url: "me@me.com"} }.to change(RegisteredApplication,:count).by(1)
    end
    
    it "assigns the new post to @post" do
      post :create, user_id: user.id, registered_application: {title: "Title", body: "Body"}
      expect(assigns(:registered_application)).to eq RegisteredApplication.last
    end
    
    it "redirects to the newly created registered_application" do
      post :create, registered_application: {name: "name", url: "url"}
      expect(response).to redirect_to [RegisteredApplication.last]
    end
    
  end
  
  describe "GET #show" do
    it "returns http success" do
      get :show, id: registered_application.id
      expect(response).to have_http_status(:success)
    end
    
     it "renders the #show view" do
      get :show, id: registered_application.id
        expect(response).to render_template :show
    end
    
     it "assigns @registered_application to user" do
      get :show, id: registered_application.id
        expect(assigns(:registered_application)).to eq(registered_application)
      end
  end




  describe "DELETE #destroy" do
    it "returns http success" do
      delete :destroy, user_id: user.id, id: registered_application.id 
      count = RegisteredApplication.where({id: registered_application.id}).size
      expect(count).to eq 0
    end
    
    it "redirects to welcome index" do
      delete :destroy, id: registered_application.id
      expect(response).to redirect_to welcome_index_path
    end
    
  end


  end


end
