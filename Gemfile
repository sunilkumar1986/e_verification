source 'https://rubygems.org'

  gem 'rails', '3.2.13'
  gem 'taps'
  gem 'execjs'
  gem 'heroku'
  gem 'devise', '3.0.3'
  gem "nested_form"
  gem 'paperclip'
  gem "therubyracer"
  gem "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
  gem "twitter-bootstrap-rails"
  gem 'rmagick', :require => 'rmagick'

  gem "mocha", :group => :test
  gem 'activeadmin'
  gem 'friendly_id'
  gem "geocoder"
  gem 'workflow'
  #gem 'matric_fu'
  gem "cancan"
  gem "best_in_place"
  gem "macaddr"
  gem 'unicorn'
  gem 'whenever', "~> 0.8.0", :require => false
  gem 'quiet_assets'
  gem 'validates_timeliness', '~> 3.0'
  gem 'kaminari'
  gem 'rails-simple-search', "~> 0.9.3"
  gem 'pg'
  gem 'carrierwave'
  gem 'jquery-rails', '~> 2.3.0'
  gem 'to_spreadsheet'

  group :development do
    gem 'thin'
    gem 'capistrano', '~> 3.1.0'
    # cap tasks to manage puma application server
    gem 'capistrano-puma', require: false
    gem 'capistrano-rails',   '~> 1.1', require: false
    gem 'capistrano-bundler', '~> 1.1', require: false
    gem 'capistrano-rvm',   '~> 0.1', require: false
    gem 'rvm1-capistrano3', :require => false
  end

  group :assets do
   gem 'sass-rails',   '~> 3.2.3'
   gem 'coffee-rails', '~> 3.2.1'
   gem 'uglifier', '>= 1.0.3'
   gem 'coffee-script-source', '~> 1.4.0' # ADD THIS LINE, 1.5.0 doesn't compile ActiveAdmin JavaScript files
   gem 'jquery-datatables-rails', github: 'rweng/jquery-datatables-rails'
   gem 'jquery-ui-rails'
  end
