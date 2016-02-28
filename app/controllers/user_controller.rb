class UserController < ApplicationController
  protect_from_forgery with: :null_session

  def create
  	if(!User.exists?(username: params[:username]))
  		@user = User.new(username: params[:username], password: params[:password], firstname: params[:firstname], lastname: params[:lastname])
  		@user.save
  		render :json => {"Type": "201", "Message": "Success, your account has been created."}
  	else 
  		render :json => {"Type": "500", "Message": "Please choose a new username."}
  	end
  end

  def edit_location
  	User.find(params[:id]).update_attributes(longitude: params[:longitude], latitude: params[:latitude])
  end

  def index
  	@users = User.where.not(id: params[:id])
  	render :json => @users
  end

  def login
  	#@user = User.find_by_username_and_password(username: params[:username], password: params[:password])
  	if(user == nil)
  		render :json => {"LoggedIn": "Unsuccessful"}
  	else
  		render :json => {"LoggedIn":  "Success"}
  	end
  end

  def test
  	@user = User.find(1)
  	render :json => {"Gender": "Male"}
  end
end
