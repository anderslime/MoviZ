source 'https://rubygems.org'

gem 'rails', '3.2.9'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

# gem 'sqlite3'
gem 'bootstrap-sass'

gem 'ruby-tmdb3'
gem 'hirb'
gem 'rest-client'
gem 'rubypython'
gem 'pg'
gem 'haml'


# Use unicorn as the app server
gem 'unicorn'

# Deploy with Capistrano
gem 'capistrano'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platform => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

group :development, :test do
  gem 'sqlite3'
end

# RubyPython gives the following error during load-time:
# /gems/blankslate-3.1.2/lib/blankslate.rb:51:
#   warning: undefining `object_id' may cause serious problems
#
# The following blankslate ref makes blankslate ignore the error (bad bad you!)
gem 'blankslate',
  :git => "git@github.com:kdurski/blankslate.git",
  :ref => "3c1ad170d11472344fdfbbc5819e39babc4763c4"

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'



# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
