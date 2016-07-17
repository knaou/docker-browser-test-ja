require 'capybara'
require 'capybara/rspec'
require 'capybara/poltergeist'

# poltergeist を使うように設定
Capybara.default_driver = :poltergeist
Capybara.ignore_hidden_elements = true
Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new app, { :timeout => 1000 }
end

module ::RSpec::Core
  class ExampleGroup
    include Capybara::DSL
  end
end
