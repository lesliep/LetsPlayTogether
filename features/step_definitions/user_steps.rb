require 'pry'
Given /^I am not signed in$/ do
  visit '/'

  expect(page).to have_content 'Sign Up'
end

Given /^I am a registered user$/ do
  @user = user
  create_user
  click_on 'Log Out'
end

Given /^I am signed in$/ do
  visit '/'

  @user = user
  sign_in_user

  expect(page).to_not have_content 'Sign Up'
end

Given /^I am a signed in user$/ do
  steps %{
    Given I am a registered user
    And I am signed in
  }
end

When /^I fill in the correct credentials$/ do
  
  sign_in_user
end

When /^I click the '([^']+)' button$/ do |link_name|
  expect(page).to have_content(link_name)
  click_on link_name
end

When /^I fill in the wrong credentials$/ do
  @user.email = 'wrong@email.com'
  sign_in_user
end

When /^I go to sign up$/ do
  create_user
end

Then /^I should be taken to the '([^']+)' page$/ do |page_name|
  expect(page).to have_css("h1", text: page_name)
end

Then /^I should see the message '([^']+)'$/ do |message|
  expect(page).to have_content message
end

Then /^I should be signed in$/ do
  expect(page).to have_content 'You have successfully signed in.'
end

Then /^I should see '([^']+)'$/ do |content|
  expect(page).to have_content content
end


def create_user
  visit '/'
  click_link 'Sign Up'

  fill_form

  click_button 'Sign up'
end

def fill_form
  fill_in 'Email', with: @user.email
  fill_in 'Username', with: @user.username if page.has_content? 'Username'
  fill_in 'Password', with: @user.password
end

def user
  @user ||= Struct.new(:email, :password, :username).new(
    'hi@email.com', 'potato', 'potato')
end


def sign_in_user
  visit '/'
  click_link 'Sign In'

  fill_form

  click_button 'Sign in'
end
