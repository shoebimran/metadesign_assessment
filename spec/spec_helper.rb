# spec/spec_helper.rb
require 'factory_bot_rails'

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  # Other suggested configurations:

  # Focus on specific examples or groups using the `:focus` tag.
  config.filter_run_when_matching :focus

  # Enable example status persistence for `--only-failures` and `--next-failure` CLI options.
  config.example_status_persistence_file_path = "spec/examples.txt"

  # Disable monkey patching of the core Ruby classes.
  config.disable_monkey_patching!

  # Use the documentation formatter for detailed output when running a single spec file.
  if config.files_to_run.one?
    config.default_formatter = "doc"
  end

  # Print the 10 slowest examples and example groups at the end of the spec run.
  config.profile_examples = 10

  # Run specs in random order.
  config.order = :random

  # Seed global randomization using the `--seed` CLI option for reproducible test failures.
  config.seed = srand % 0xFFFF
end
