class Admin::AdminController < ApplicationController
  # GET /users
  def index
    @users = User.all
    render '/admin/users/index'
  end
end
