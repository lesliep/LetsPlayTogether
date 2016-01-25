class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :social_media_accounts

  validates :display_name,
    presence: true,
    length: { minimum: 2, maximum: 20 }

  validates :user_id,
    presence: true
end
