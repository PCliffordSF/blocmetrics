class RegisteredApplicationsController < ApplicationController
  
  
  def new
    @registered_application = RegisteredApplication.new
    render :new
  end

  def create
     @registered_application = RegisteredApplication.new
     @registered_application.name = params[:registered_application][:name]
     @registered_application.url = params[:registered_application][:url]
     @registered_application.user_id = current_user.id

     if@registered_application.save
       flash[:notice] = "The registered application was saved!!!"
       redirect_to @registered_application # wiki_path(@wiki.id)
     else

       flash.now[:alert] = "There was an error saving the registered application. Please try again."
       render :new
     end
    
    
  end

  def update
  end

  def edit
  end

  def destroy
    @registered_application = RegisteredApplication.find(params[:id])
     if @registered_application.destroy
       flash[:notice] = "\"#{@registered_application.name}\" was deleted successfully."
       redirect_to welcome_index_path
     else
       flash.now[:alert] = "There was an error unregiserting the application."
       render :show
     end
  end

  def index
    @registered_applications = RegisteredApplication.all
    @registered_applications = @registered_applications.reverse #this feels like a dirty way to sort by time
    render :index
  end

  def show
      @registered_application = RegisteredApplication.find(params[:id])
      
      @events = @registered_application.events.group_by(&:name)
      @events = Hash[ @events.sort_by { |key, val| key } ]
      render :show
      
  end
  
end
