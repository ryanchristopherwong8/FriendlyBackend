module Authenticable

  # overrides the Devise current_user method
  # gets current user by authentication token in request headers
  def current_user
    @current_user ||= User.find_by(auth_token: request.headers['Authorization'])
  end

  def authenticate_with_token!
    render json: { errors: "Not authenticated" },
                status: :unauthorized unless current_user.present?
  end
  
end