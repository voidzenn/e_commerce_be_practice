class Api::V1::AuthenticationController < ApplicationController
  before_action :authorize_request, except: %i[login]

  def login
    @user = find_email(params[:email])
    if @user&.authenticate(params[:password])
      render json: { token: jwt_token, exp: jwt_time_formatted }, status: :ok
    else
      render json: { error: "unauthorized" }, status: :unauthorized
    end
  end

  private

  def login_params
    params.permit(:email, :password)
  end
end
