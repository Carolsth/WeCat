RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.clean.with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = transaction
  end

  config.before(:each, js: true) do
    DatabaseCleaner.strategy = transaction
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
