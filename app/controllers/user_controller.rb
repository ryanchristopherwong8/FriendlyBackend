class UserController < ApplicationController
  protect_from_forgery with: :null_session

  def create
  	if(!User.exists?(username: params[:username]))
  		@user = User.new(username: params[:username], password: params[:password], firstname: params[:firstname], lastname: params[:lastname])
  		@user.save
  	else 
  		render :json => {"Error": "Please choose a new username"}
  	end
  end

  def edit_location
  	User.find(params[:id]).update_attributes(longitude: params[:longitude], latitude: params[:latitude])
  end

  def index
  	@users = User.all
  	respond_to do |format|
  		format.json { render :json => @users}
  	end
  end

  def login
  	@boolean = User.exists?(username: params[:username], password: params[:password])
  	if(@boolean == true)
  		render :json => {"LoggedIn":  "Success"}
  	else
  		render :json => {"LoggedIn": "Unsuccessful"}
  	end
  end

  def create2
  	@user = User.find(1)
  	render :json => {"Gender": "Male"}
  end
end
