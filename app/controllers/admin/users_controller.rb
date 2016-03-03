module Admin
  class UsersController < AdminsController
    before_action :set_user, only: [:show, :edit, :destroy, :update]

    def index
      @users = User.regular_users
    end

    def show
    end

    def new
      @user = User.new
    end

    def edit
    end

    def create
      @user = User.new(user_params)
      if @user.save
        flash[:success] = 'New User Created.'
        redirect_to admin_create_user_path
      else
        render :new
      end
    end

    def update
      if @user.update(user_params)
        flash[:success] = 'New User Created.'
        redirect_to admin_create_user_path
      else
        render :edit
      end
    end

    def destroy
      @user.destroy
      flash[:success] = 'User deleted.'
      redirect_to :back
    end

    def admins
      @users = User.is_admin
      render :index
    end

    private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(
          :email, :password, :password_confirmation, :username, :first_name, :job_title, :last_name, :client_id, :admin, :broker
        )
    end

  end
end