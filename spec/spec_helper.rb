require 'bundler/setup'
require 'mongoid-embedded-errors'
require 'database_cleaner'

Mongoid.load!(File.join(File.dirname(__FILE__), 'config.yml'), :test)
require File.join(File.dirname(__FILE__), 'support', 'models')

DatabaseCleaner[:mongoid].strategy = :truncation

RSpec.configure do |config|
  config.before(:each) do
    DatabaseCleaner.clean
  end
end
