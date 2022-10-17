class Admin::UsersController < Admin::BaseController
  before_action :is_authenticated, only: %w[create]
  before_action :find_user, only: %w[show edit]
  before_action :new_user, only: %w[create]

  def index
    @users = User.all
  end

  def new
  end

  def create
    if @user.save
      redirect_to new_admin_user_path, {success: "Successfully Saved"}
    else
      redirect_to new_admin_user_path, {error: @user.errors.full_messages}
    end
  end

  def show
  end

  def edit
  end

  private

  def find_user
    begin
      @user = User.find params[:id]
    rescue
      redirect_to :index
    end
  end

  def new_user
    @user = User.new user_params
    @user.skip_password_validation = true
  end

  def user_params
    params.permit :fname, :lname, :email, :gender, :age, :role_id
  end
end
