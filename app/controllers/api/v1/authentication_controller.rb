class Api::V1::AuthenticationController < Api::V1::BaseController
  before_action :authorize_request, except: %i[signin signup]
  skip_before_action :verify_authenticity_token, only: %i[signin signup]

  def signin
    @user = validate_signin(sigin_params[:email])
    if @user&.authenticate(sigin_params[:password]) && is_user_admin(@user.role_id)
      render json: { token: jwt_encode( user_id: @user.id ), exp: jwt_time, status: "success" }
    else
      render json: { error: "Email or Password is incorrect", status: "failed" }
    end
  end

  def signup
    @user = User.create signup_params
    if @user.save && is_user_admin(signup_params[:role_id])
      render json: { message: "Successfully Signed up", status: "success" }
    else
      render json: { message: "Failed to Signup", error: @user.errors, status: "failed" }
    end
  end

  private

  def sigin_params
    params.permit(:email, :password)
  end

  def validate_signin email
    @validate_signin = User.find_by_email email
  end

  def is_user_admin role_id
    # Dont accept 1 or admin value
    role_id.to_i > 1
  end

  def signup_params
    params.permit(:role_id, :fname, :lname, :password, :email, :age, :gender, :address)
  end
end
