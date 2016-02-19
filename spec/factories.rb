require 'faker'

FactoryGirl.define do

  factory :user do
    username { Faker::Internet.user_name }
    email { Faker::Internet.email }
    password_digest 'foobar123'
  end

  factory :profile do
    user
    display_name { Faker::Internet.user_name }
    about { Faker::Lorem.paragraph }
    website { Faker::Internet.url }
    byline { Faker::Lorem.sentence }

  end

  factory :social_media_account do
    profile
    provider { SocialMediaAccount.providers.take(1)[0][1] }
    url { Faker::Internet.url }
    username { Faker::Internet.user_name }
  end
end
