class ProfilesController < ApplicationController
  before_action :set_profile_session, only: [:edit, :update]
  before_action :set_profile, only: [:edit, :update, :show]

  authorize_resource

  def new
    @profile = Profile.new
  end

  def edit
  end

  def show
  end

  def create
    @profile = current_user.profiles.build(profile_params)
    if @profile.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    if @profile.update(profile_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:about, :website, :byline,
                                    :display_name )
  end

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def set_profile_session
    session[:profile_id] = params[:id] unless session[:profile_id] == params[:id]
  end
end
