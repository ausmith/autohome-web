source 'http://rubygems.org'

gem 'rails', '3.1.1'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'

gem 'json'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.4'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'compass-rails'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
gem 'capistrano'

# To use debugger
# gem 'ruby-debug'

gem 'ledermann-rails-settings', :require => 'rails-settings'
gem 'clearance'
gem 'formtastic'
gem 'flutie'
gem 'bourbon'
gem 'paperclip'
gem 'thin'
gem 'sass'
gem 'high_voltage'


group :development do
  gem 'email_spec'
  gem 'heroku'
end

group :test, :development do
  gem 'rspec-rails'
end

group :test do
  gem 'cucumber-rails'
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'factory_girl_rails'
  gem 'timecop'
  gem 'email_spec'
  gem 'bourne'
  gem 'database_cleaner'
  gem 'shoulda-matchers'
  gem 'launchy'
  gem 'execjs'
  gem 'therubyracer'
end

group :staging, :production do
  gem 'airbrake'
  gem 'newrelic_rpm'
end
