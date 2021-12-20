require 'capybara/rspec'
require 'selenium-webdriver'

RSpec.configure do |config|
  config.include Capybara::DSL
end

Capybara.register_driver :chromium_headless do |app|
  opts = ::Selenium::WebDriver::Chrome::Options.new()
  opts.add_argument('--headless')
  opts.add_argument('--no-sandbox')
  opts.add_argument('--disable-gpu')
  driver = Capybara::Selenium::Driver.new(app, browser: :chrome, capabilities: [opts])
end
Capybara.default_driver = :chromium_headless

