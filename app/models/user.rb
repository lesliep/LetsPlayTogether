class User < ActiveRecord::Base

  validates :email, presence: true, uniqueness: true

  validates :username, presence: true,
    length: { minimum: 2, maximum: 20 },
    uniqueness: true

  validates :password_digest, presence: true

  has_one :profile, dependent: :destroy

  has_many :friendships

  has_many :passive_friendships,
    :class_name => "Friendship",
    :foreign_key => :friend_id

  has_many :active_friends, -> { where(friendships: { accepted: true}) },
    :through => :friendships,
    :source => :friend

  has_many :passive_friends, -> { where(friendships: { accepted: true }) },
    :through => :passive_friendships,
    :source => :user

  has_many :pending_friends, -> { where(friendships: { accepted: false }) },
    :through => :friendships,
    :source => :friend

  has_many :requested_friendships, -> { where(friendships: { accepted: false }) },
    :through => :passive_friendships,
    :source => :user


  has_many :social_media_accounts,
    :dependent => :destroy

  # Returns an array of available account types that have not been
  # verified for this particular profile.
  def unverified_social_media_accounts
    verified_accounts = social_media_accounts.map { |account| account.provider }

    providers = SocialMediaAccount.all_providers
    providers.reject { |provider| verified_accounts.include? provider }
  end

  def friends
    active_friends | passive_friends
  end
end
