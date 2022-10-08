class HomeController < ApplicationController
  def index
    if is_authenticated?
      redirect_to admin_users_path
    else
      render "/sign_in"
    end
  end

  private

  def is_authenticated?
    @is_authenticated = cookies[:user_id] ? true : false
  end
end
