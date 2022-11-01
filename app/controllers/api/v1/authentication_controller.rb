class Api::V1::AuthenticationController < ApplicationController
  before_action :authorize_request, except: %i[login register]
  skip_before_action :verify_authenticity_token, only: :register

  def login
    @user = find_email(params[:email])
    if @user&.authenticate(params[:password])
      render json: { token: jwt_token, exp: jwt_time_formatted }, status: :ok
    else
      render json: { error: "unauthorized" }, status: :unauthorized
    end
  end

  def register
    @user = User.create register_params
    # render json: {message: @users}
    if @user.save
      render json: { message: "success" }
    else
      render json: { message: @user.errors.full_messages }
    end
  end

  private

  def login_params
    params.permit(:email, :password)
  end

  def register_params
    params.permit(:fname, :lname, :email, :password, :age, :gender, :address, :email, :password)
  end
end
