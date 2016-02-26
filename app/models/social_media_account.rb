class SocialMediaAccount < ActiveRecord::Base

  enum provider: [:twitch, :twitter, :youtube, :steam, :psn, :xbox]
  belongs_to :user

  validates :profile_id, 
    presence: true

  validates :provider, 
    presence: true

  validates :username, 
    presence: true, 
    length: { maximum: 30 }

  validates :url,
    length: { maximum: 60 }

  def self.all_providers
    providers.keys
  end

end
