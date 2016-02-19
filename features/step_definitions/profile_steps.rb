Given /^I have a profile$/ do
  visit dashboard_path

  create_profile
  expect(page).to have_content 'My Profiles'
end

When /^I click '([^']+)'$/ do |link_name|
  expect(page).to have_link link_name

  click_on link_name
end

def create_profile
  visit '/'
  click_on 'Create a Profile'

  fill_in 'Display name', with: 'potato'

  click_on 'Create Profile'
end
