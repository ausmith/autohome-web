source 'https://rubygems.org'

gem 'rails', '3.2.10'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem 'less-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
gem 'capistrano'

# To use debugger
# gem 'debugger'

gem 'ledermann-rails-settings', :require => 'rails-settings' # Key-value based settings in the DB
gem 'simple_form'  # Creating forms
gem 'devise'       # Authentication
gem 'bourbon'      # Scss pre-made styles. Could be useful; not 100% if we need this.
#gem 'paperclip'   # Attaching files. Not sure if we need this
gem 'sass'         # SASS CSS language
gem 'high_voltage' # Semi-static pages. Likely will be used for help pages.
gem 'twitter-bootstrap-rails' # Twitter Bootstrap integration with Rails env
gem 'airbrake'           # Error tracking


group :development do
  gem 'thin' # A better DEV server
  gem 'guard'
  gem 'guard-cucumber'
  gem 'guard-rspec'
  gem 'growl'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request'
end

group :development, :test do
  gem 'rb-inotify', '~> 0.8.8'
  gem 'faker'
  gem 'rspec'
  gem 'email_spec'
  gem 'rspec-rails'
  gem 'ZenTest'
  gem 'autotest-rails'
  gem 'simplecov'          # Code coverage
  gem 'webrat'
end

group :test do
  gem 'cucumber-rails'     # Cucumber testing engine
  gem 'capybara'           # Testing web interfaces
  gem 'capybara-webkit', '~> 0.11.0'    # Testing Javascript a headless browser. Build env can't use > 0.12 due to Qt4.7+ issues on old LTS
  gem 'factory_girl_rails' # A replacement for fixtures (which kinda suck)
  gem 'timecop'            # Testing time-dependent code
  gem 'database_cleaner'   # Cleaning DB between tests
  gem 'shoulda-matchers'   # Rspec-compatible one-liners to test common Rails functionality
  gem 'launchy'            # I don't think we need this
  gem 'execjs'             # Run Javascript from Ruby code
  gem 'therubyracer'       # V8 Javascript interpreter for Ruby
  gem 'pickle'             # Cucumber steps to integrate easily with Factory Girl
end

group :staging, :production do
  gem 'newrelic_rpm'       # Performance tracking
end
