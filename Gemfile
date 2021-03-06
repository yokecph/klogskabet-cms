source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'

# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.3.18', '< 0.5'

# Use resque for ActiveJob
gem 'resque'

# Use Puma as the app server
gem 'puma', '~> 3.7'

# Use devise for user authentication
gem 'devise'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Add jQuery like it's 2012
gem 'jquery-rails'

# Use Bootstrap
gem 'bootstrap-sass', '~> 3.3.6'

# Use paperclip for file uploads
gem 'paperclip', '~> 5.0.0'

# Use semantic versioning
gem 'semver'

# Use figaro for general config
gem 'figaro'

# Use addressable to generate external URLs
gem 'addressable'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a
  # debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  # Use RSpec for testing
  gem 'rspec-rails'

  # Use FactoryBot to create test records
  gem 'factory_bot_rails'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %>
  # anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'

  # Spring speeds up development by keeping your application running in the
  # background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  # Use Capistrano for deployment
  gem 'capistrano-rails'

  # Use letter_opener for email previews
  gem 'letter_opener'
end

group :test do
  # Use Simplecov for test coverage checks
  gem 'simplecov', '~> 0.11', require: false

  # Use json_expressions for matching JSON responses
  gem 'json_expressions', '~> 0.9.0'

  # Use shoulda for validation testing
  gem 'shoulda-matchers'
end

group :production do
  # Use Unicorn as the app server
  gem 'unicorn'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
