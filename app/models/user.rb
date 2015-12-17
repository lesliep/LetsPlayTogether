class User < ActiveRecord::Base

  validates :email, presence: true, uniqueness: true

  validates :username, presence: true,
    length: { minimum: 2, maximum: 20 },
    uniqueness: true

  validates :password_digest, presence: true

  has_many :profiles, dependent: :destroy
end
