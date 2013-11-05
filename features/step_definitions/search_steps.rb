Given(/^I am on the home page$/) do
  visit('/')
  Capybara.current_session.driver.browser.manage.window.resize_to(1280, 1024)
end

Given(/^I have entered (.*) into the "([^"]*)" field$/) do |text, field|
  fill_in field, :with => text
end

When /^I click the "([^"]*)" button$/ do |button_text|
  click_button 'gbqfb'
end

Then /^I should see (.*)$/ do |text|
  page.should have_content(text)
  page.save_screenshot('screenshots/'+text+"screenshot-"+ENV['BROWSER']+".jpg")
end

