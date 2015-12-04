Given /^I am not signed in$/ do
  visit '/'

  expect(page).to have_content 'Sign Up'
end

When /^I click the '([^']+)' button$/ do |link_name|
  click_on link_name

  expect(page).to have_content(link_name)
end

Then /^I should be taken to the '([^']+)' page$/ do |page_name|
  expect(page).to have_css("h1", text: page_name)
end
