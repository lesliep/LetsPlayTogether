class SocialMediaAccount < ActiveRecord::Base

  enum provider: [:twitch]
  belongs_to :profile

end
