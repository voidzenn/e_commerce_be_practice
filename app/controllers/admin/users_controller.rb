class Admin::UsersController < Admin::BaseController
  before_action :is_authenticated, only: %w[create]
  before_action :find_user, only: %w[show edit]

  def index
    @users = User.all
    render "/admin/users/index"
  end

  def new
    @user = User.new(user_params)
  end

  def create
      @user = User.new(user_params)
      if false
        # redirect_to new_admin_user_path, notice: "Successfully Saved"
      else
        # flash[:alert] = "Error"
        redirect_to new_admin_user_path
      end
  end

  def show
    render "/admin/users/view"
  end

  def edit
  end

  private

  def find_user
    begin
      @user = User.find(params[:id])
    rescue
      redirect_to :index
    end
  end

  def user_params
    params.permit(
      :fname, :lname, :email, :gender, :age,
    )
  end
end
