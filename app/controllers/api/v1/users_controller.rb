class Api::V1::UsersController < ApplicationController
  respond_to :json
  #before update and destroy check authentication
  before_action :authenticate_with_token!, only: [:update, :destroy]

  def show
    respond_with User.find(params[:id])
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: 201, location: [:api, user]
    else
      render json: { errors: user.errors }, status: 422
    end
  end

  def update
  	#gets user using current_user
  	#the method has been overrided so that it gets current_user by authentication token from request headers
 		user = current_user

  	if user.update(user_params)
    	render json: user, status: 200, location: [:api, user]
  	else
    	render json: { errors: user.errors }, status: 422
  	end
  end

  def destroy
  	#uses overrided current_user method
    current_user.destroy
    head 204
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end

