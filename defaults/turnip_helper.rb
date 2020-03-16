require 'turnip'
require 'turnip/rspec'
require 'turnip/capybara'

Dir.glob('spec/steps/**/*_steps.rb').each { |f| require File.expand_path(f) }

