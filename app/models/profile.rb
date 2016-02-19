class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :social_media_accounts

  validates :display_name,
    presence: true,
    length: { minimum: 2, maximum: 20 }

  validates :user_id,
    presence: true


  # Returns an array of available account types that have not been
  # verified for this particular profile.
  def unverified_social_media_accounts
    verified_accounts = social_media_accounts.map { |account| account.provider }

    providers = SocialMediaAccount.all_providers
    providers.reject { |provider| verified_accounts.include? provider }
  end

end
