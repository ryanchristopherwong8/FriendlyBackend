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
  	User.find_by(username: params[:username], password: params[:password]).update_attributes(longitude: params[:longitude], latitude: params[:latitude])
  end

  def index
  	@users = User.where.not(username: params[:username])
  	render :json => @users
  end

  def login
  	@user = User.find_by(username: params[:username], password: params[:password])
  	if(@user == nil)
  		@user.update_attributes(isLoggedIn: false)
  		render :json => {"Type": "500" "Unsuccessful"}
  	else
  		@user.update_attributes(isLoggedIn: true)
  		render :json => {"Type": "201", "Message": "Success, you are logged in."}
  	end
  end

  def logout
    User.find_by(username: params[:username], password: params[:password]).update_attributes(isLoggedIn: false)
    render :json =>{"Type": "201", "Message": "Success, you are logged out."}
  end

  def near
	  	@user = User.find_by(username: params[:username], password: params[:password])
	  	@lat = @user.latitude
	  	@long = @user.longitude
	  	require 'json'
	  	@lat.to_json
	  	@long.to_json
	  	@users = User.within(3700, :units => :kms, :origin => [@user.latitude, @user.longitude])
	  	render :json => @users
  	end

  def test
  	@user = User.find(1)
  	render :json => {"Gender": "Male"}
  end
end
