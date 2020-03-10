require 'capybara/rspec'
require 'selenium-webdriver'

RSpec.configure do |config|
  config.include Capybara::DSL
end

Capybara.register_driver :chromium_headless do |app|
  opts = ::Selenium::WebDriver::Chrome::Options.new()
  opts.args << '--headless'
  opts.args << '--no-sandbox'
  opts.args << '--disable-gpu'
  driver = Capybara::Selenium::Driver.new(app, browser: :chrome, options: opts)
end
Capybara.default_driver = :chromium_headless

