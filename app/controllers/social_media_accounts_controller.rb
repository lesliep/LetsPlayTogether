class SocialMediaAccountsController < ApplicationController
  before_action :profile

  def create
    @hash = auth_hash
    social_media_account = begin
                             send("parse_#{@hash["provider"]}")
                           rescue NoMethodError
                             nil
                           end

    if @profile.social_media_accounts.create(social_media_account)
      flash[:info] = "Account added."
    else
      flash[:alert] = "Could not add account"
    end
    redirect_to edit_profile_path(@profile)
  end

  def failure
    flash[:alert] = "Authentication error: #{params[:message].humanize}"
    redirect_to edit_profile_path(@profile)
  end


  private

  def profile
    @profile ||= Profile.find(session[:profile_id])
  end

  def auth_hash
    request.env["omniauth.auth"]
  end

  def parse_twitch
    {
      url: "http://www.twitch.tv/#{@hash["extra"]["raw_info"]["display_name"]}",
      provider: @hash["provider"],
      username: @hash["extra"]["raw_info"]["display_name"]
    }
  end
end
