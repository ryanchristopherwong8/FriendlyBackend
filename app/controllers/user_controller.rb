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
  	@user = User.find_by(username: params[:username], password: params[:password])
  	if(@user == nil)
  		@user.update_attributes(isLoggedIn: false)
  		render :json => {"Type": "201" "Unsuccessful"}
  	else
  		@user.update_attributes(isLoggedIn: true)
  		render :json => {"Type": "500", "Message": "Success, you are logged in."}
  	end
  end

  def logout
    User.where(username: params[:username], password: params[:password]).update_attribute(isLoggedIn: false)
  end


  def test
  	@user = User.find(1)
  	render :json => {"Gender": "Male"}
  end
end
