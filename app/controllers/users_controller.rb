class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  after_action :build_profile, only: [:create]
  before_action :set_user, only: [:show]

  authorize_resource

  def new
    @user = User.new
  end

  def create
    @user = sign_up(user_params)

    if @user.valid?
      sign_in(@user)
      flash[:success] = 'Registration successful'
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @profile = @user.profile
    @social_media_accounts = @user.social_media_accounts
  end

  def index
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :password)
  end

  def build_profile
    @user.create_profile(display_name: @user.username)
  end

  def set_user
    @user = User.find_by_id(params[:id])
  end
end
