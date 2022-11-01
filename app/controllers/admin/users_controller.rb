class Admin::UsersController < Admin::BaseController
  before_action :is_authenticated, only: %w[index create edit destroy]
  before_action :find_user, only: %w[show edit]
  before_action :new_user, only: %w[create]
  before_action :is_not_self, only: %w[edit destroy]

  def index
    @users = User.all
  end

  def new
  end

  def create
    if @user.save
      redirect_to new_admin_user_path, { success: "Successfully Saved" }
    else
      redirect_to new_admin_user_path, { error: @user.errors.full_messages }
    end
  end

  def show
  end

  def edit
  end

  def update
    begin
      User.update user_params
      redirect_to edit_admin_user_path, { success: "Successfully Updated" }
    rescue
      render edit_admin_user_path, { error: ["error1", "error2"] }
    end
  end

  def destroy
    if User.destroy params[:id]
      redirect_to admin_users_path, { success: "Successfully Deleted" }
    else
      redirect_to admin_users_path, { error: "Error, Please Try Again" }
    end
  end

  private

  def find_user
    begin
      @user = User.find params[:id]
    rescue
      redirect_to admin_users_path, { error: "User not found" }
    end
  end

  def new_user
    @user = User.new user_params
    @user.skip_password_validation = true
  end

  def is_not_self
    if current_admin == params[:id].to_i
      redirect_to admin_users_path, { error: "Cannot Modify Self" }
    end
  end

  def user_params
    params.permit :fname, :lname, :email, :gender, :age, :role_id
  end
end
