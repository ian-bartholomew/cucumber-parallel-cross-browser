# require 'rspec/expectations'
# require 'capybara'
# require 'capybara/mechanize'
# require 'capybara/cucumber'
# require 'test/unit/assertions'
# require 'mechanize'

# World(Test::Unit::Assertions)

# Capybara.default_driver = :mechanize
# Capybara.app_host = "http://www.google.com"
# World(Capybara)

begin require 'rspec/expectations'; rescue LoadError; require 'spec/expectations'; end
require 'capybara' 
require 'capybara/poltergeist'
require 'capybara/dsl' 
require 'capybara/cucumber'

Capybara.app_host = 'http://www.google.com' 

# DEFAULT: headless tests with poltergeist/PhantomJS


# Capybara.default_driver = :selenium

Capybara.register_driver :selenium_ie do |app|
  Capybara::Selenium::Driver.new(app,
    :browser => :remote,
    :url => "http://localhost:4444/wd/hub",
    :desired_capabilities => :internet_explorer)
end

Capybara.register_driver :selenium_chrome do |app|
  Capybara::Selenium::Driver.new(app,:browser => :chrome)
end

case ENV['BROWSER']
  when 'ie', 'Internet Explorer'
    Capybara.default_driver = :selenium_ie	
  when 'ff', 'Firefox', 'firefox'
    Capybara.default_driver = :selenium
	Capybara.javascript_driver = :selenium
  when 'chrome'
    Capybara.default_driver = :selenium_chrome
	Capybara.javascript_driver = :selenium_chrome
  when 'headless'
  	Capybara.register_driver :poltergeist do |app|
	  Capybara::Poltergeist::Driver.new(
	    app,
	    window_size: [1280, 1024]#,
	    #debug:       true
	)
	end
	Capybara.default_driver    = :poltergeist
	Capybara.javascript_driver = :poltergeist
  else
    Capybara.default_driver = :selenium
end

World(Capybara)