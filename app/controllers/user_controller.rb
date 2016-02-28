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
	  	@users = User.within(3700, :units => :kms, :origin => [@user.latitude, @user.longitude]).by_distance(:origin => [@user.latitude, @user.longitude]).where.not(username: params[:username])
	  	calculateShortestDistance(@users, @lat, @long)
	  	render :json => @users
  end

  def calculateShortestDistance(users, original_lat, original_long)
  	require 'json'
  	users.to_json
  	for user in @users
  	  @new_lat = user.latitude
  	  @new_long = user.longitude
  	  user.distance = getShortDistance(original_lat, original_long, @new_lat, @new_long)
  	end
  	return @users	
  end

  def getShortDistance(original_lat, original_long, new_lat, new_long)

	  dtor = Math::PI/180
	  r = 6378.14*1000

	  rlat1 = original_lat * dtor 
	  rlong1 = original_long * dtor 
	  rlat2 = new_lat * dtor 
	  rlong2 = new_long * dtor 

	  dlon = rlong1 - rlong2
	  dlat = rlat1 - rlat2

	  a = power(Math::sin(dlat/2), 2) + Math::cos(rlat1) * Math::cos(rlat2) * power(Math::sin(dlon/2), 2)
	  c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1-a))
	  d = r * c
	  # / 1000 for kilometers
	  return d / 1000
   end

   def power(num, pow)
		num ** pow
	end
end
