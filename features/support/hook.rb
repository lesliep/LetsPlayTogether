include Monban::Test::Helpers

Before('@login') do

  user = FactoryGirl.create(:user)

  sign_in(user)
end
