source 'http://rubygems.org'

gem 'rails', '3.1.0'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'
gem 'therubyracer'
gem 'simple_form'
gem 'will_paginate', '~> 3.0.2'
gem 'inherited_resources'
#incerc twitter ca primu auth, inca nu merge
gem 'oa-oauth'
gem 'twitter'

gem 'prawn', :git => 'git://github.com/sandal/prawn.git', :tag => '0.11.1', :submodules => true

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

gem 'jquery-rails'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
end
group :develompment do
  gem 'rails-erd'
  gem 'pry-rails'
end
group :production do
  #pentru heroku
  gem 'therubyracer-heroku', '0.8.1.pre3'
  gem 'pg'
end

#gem "irt"
