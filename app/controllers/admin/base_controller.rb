class Admin::BaseController < ApplicationController
  include SecuredRequest

  private

  def current_admin
    return unless !is_authenticated
    @decoded = jwt_decode(cookies[:user_id])
    @current_admin = User.find_by(id: @decoded[:user_id]).id
  end

  helper_method :current_admin
end
