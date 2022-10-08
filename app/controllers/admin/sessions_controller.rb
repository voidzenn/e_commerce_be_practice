class Admin::SessionsController < ApplicationController
  def destroy
    session.delete(:user_id)
    # redirect_to root_path, notice: "Signed out successfully"
  end
end
