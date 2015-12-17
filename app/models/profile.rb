class Profile < ActiveRecord::Base
  belongs_to :user

  validates :display_name,
    presence: true,
    length: { minimum: 2, maximum: 20 }

  validates :user_id,
    presence: true
end
