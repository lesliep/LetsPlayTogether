class Profile < ActiveRecord::Base
  belongs_to :user

  validates :display_name,
            length: { minimum: 2, maximum: 20 }

  validates :user_id,
            presence: true

  def filled?
    website || about || byline
  end
end
