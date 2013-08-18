###############################################################################
# This file is part of The Autohome Project.
#
# The Autohome Project is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# The Autohome Project is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with The Autohome Project.  If not, see <http://www.gnu.org/licenses/>.
###############################################################################

source 'https://rubygems.org'

gem 'rails', '3.2.10'

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
gem 'enumerated_attribute', :git => 'git://github.com/jeffp/enumerated_attribute.git' # Allows for enums in migrations
gem 'coveralls', require: false


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
  gem 'rb-inotify', :require => false
  gem 'rb-fsevent', :require => false
  gem 'rb-fchange', :require => false
  gem 'ffaker'
  gem 'rspec'
  gem 'email_spec'
  gem 'rspec-rails'
  gem 'ZenTest'
  gem 'autotest-rails'
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
  gem 'simplecov', :require => false    # Code coverage
end

group :staging, :production do
  gem 'newrelic_rpm'       # Performance tracking
end
