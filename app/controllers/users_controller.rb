class UsersController < ApplicationController

  before_action :require_login, only: [:show, :index]

  def index
    @users = User.all
  end

  def new
    @user =User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

    def require_login
      unless logged_in?
        flash[:error] = "Please log in"
        redirect_to login_path
      end
    end

    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end
end