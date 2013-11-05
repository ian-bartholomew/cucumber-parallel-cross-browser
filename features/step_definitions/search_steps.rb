Given(/^I am on the home page$/) do  
  if (ENV['BROWSER'] == 'headless')
  	page.driver.resize_window(1280, 1024)
  else 
  	Capybara.current_session.driver.browser.manage.window.resize_to(1280, 1024)
  end  

  visit('/')  
end

Given(/^I have entered (.*) into the "([^"]*)" field$/) do |text, field|
  if (ENV['BROWSER'] == 'headless') 
  	field = 'q'
  end
  fill_in field, :with => text
end

When /^I click the "([^"]*)" button$/ do |button_text|    
  # this doesn't exist on the phantomjs version.  Google doing user agent checks?
  if (ENV['BROWSER'] == 'headless') 
  	click_button "Google Search"
  else
    click_button 'gbqfb'
  end
end

Then /^I should see (.*)$/ do |text|
  page.should have_content(text)
  page.save_screenshot('screenshots/'+text+"screenshot-"+ENV['BROWSER']+".jpg")

  # another way of doing screen shots:

  # stamp = Time.now.strftime("%Y%m%d%H%M%S");
  # page.save_screenshot("screenshots/screen-#{ENV['BROWSER']-#{stamp}}.png")
end

