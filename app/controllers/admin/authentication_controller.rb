class Admin::AuthenticationController < Admin::BaseController
  def login
    @user = find_email params[:email]
    if @user&.authenticate(params[:password])
      cookies[:user_id] = jwt_token user_id: params[user_id: @user.id]
      cookies[:expiry] = jwt_time
      redirect_to admin_users_path
    else
      redirect_to root_path, alert: "error in signing in"
    end
  end

  def logout
    cookies.delete :user_id
    redirect_to root_path
  end

  def login_params
    params.permit(:email, :password)
  end
end
