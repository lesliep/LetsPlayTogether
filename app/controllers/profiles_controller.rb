class ProfilesController < ApplicationController
  before_action :set_profile, only: [:edit, :update]

  def edit
    @social_media_accounts = current_user.social_media_accounts
    @unverified_social_media_accounts =
      current_user.unverified_social_media_accounts
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
    params.require(:profile).permit(:about, :website, :byline, :display_name)
  end

  def set_profile
    @profile ||= User.find_by_id(params[:user_id]).profile
  end
end
