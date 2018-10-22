require "bundler/setup"
require "html_from_pdf"

def fixtures_path
  File.expand_path('../fixtures', __FILE__)
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.after(:each) { FileUtils.rm_rf '/tmp/html_from_pdf' }
end
