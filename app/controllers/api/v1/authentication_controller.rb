class Api::V1::AuthenticationController < ApplicationController
  before_action :authorize_request, except: %i[login   signup]
  skip_before_action :verify_authenticity_token, only: :signup

  def login
    @user = find_email(params[:email])
    if @user&.authenticate(params[:password])
      render json: { token: jwt_token, exp: jwt_time_formatted }, status: :ok
    else
      render json: { error: "unauthorized" }, status: :unauthorized
    end
  end

  def signup
    @user = User.create signup_params
    if @user.save && validate_signup?
      render json: { message: "Successfully Signed up", status: "success" }
    else
      render json: { message: "Failed to Signup", error: @user.errors, status: "failed" }
    end
  end

  private

  def login_params
    params.permit(:email, :password)
  end

  def validate_signup?
    # Dont accept 1 or admin value
    signup_params[:role_id].to_i > 1
  end

  def signup_params
    params.permit(:role_id, :fname, :lname, :password, :email, :age, :gender, :address)
  end
end
