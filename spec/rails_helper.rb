# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'

# Add additional requires below this line. Rails is not loaded until this point!
# You may require additional gems or support files here if needed.

RSpec.configure do |config|
  # Use transactions to wrap each example in a transaction. This is generally preferred.
  config.use_transactional_fixtures = true

  # Define a shared context for Devise tests.
  config.include Devise::Test::ControllerHelpers, type: :controller

  # Infer the spec type based on the folder structure. For example, a controller spec should be in spec/controllers.
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures.
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
end
