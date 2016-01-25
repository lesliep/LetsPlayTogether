class SocialMediaAccountsController < ApplicationController

  def create
    render text: auth_hash.to_yaml
    #type_params = parse(auth_hash)
    #profile.social_media_account.build(type_params)
  end

  def failure
    raise params.inspect
  end


  private

  def profile
    @profile ||= Profile.find(params[:profile_id])
  end

  def auth_hash
    request.env["omniauth.auth"]
  end

  def parse type
    {
      :provider => type["provider"],
      :username => type["extra"]["raw_info"]["display_name"],
    }
  end
end
