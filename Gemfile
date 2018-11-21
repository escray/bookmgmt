source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless
    repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails'
# Turbolinks makes navigating your web application faster.
# Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# bundle exec rake doc:rails generates the API under doc/api
gem 'sdoc', group: :doc
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
# Use Unicorn as the app server
# gem 'unicorn'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'aasm'
gem 'active_model_serializers'
gem 'bootstrap-datepicker-rails'
gem 'bootstrap-sass'
gem 'bootstrap-tagsinput-rails'
gem 'carrierwave'
gem 'ckeditor'
gem 'devise'
gem 'fog'
gem 'font-awesome-rails'
gem 'masonry-rails'
gem 'material_icons'
gem 'mini_magick'
gem 'net-ssh'
gem 'pundit'
# filter
gem 'ransack'
# gem 'searcher', github: 'radar/searcher'
gem 'select2-rails'
gem 'simple_form'
gem 'sinatra'
gem 'xmlrpc'

# i18n
gem 'devise-i18n'
gem 'rails-i18n'

# export excel file
gem 'axlsx'
gem 'axlsx_rails'
gem 'zip-zip'
# gem 'rubyzip', '~> 0.9.9'

# paginate
gem 'kaminari'
# gem 'will_paginate'
# gem 'will_paginate-bootstrap'

gem 'nested_form_fields'
gem 'paper_trail'
gem 'ranked-model'

# chart
gem 'chart-js-rails'
# e-mail CSS
gem 'premailer-rails'

gem 'sidekiq'

group :development, :test do
  # Call 'byebug' anywhere in the code
  # to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'rspec-rails'
  # Spring speeds up development by keeping your application running
  # in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :development do
  gem 'faker'
  gem 'letter_opener'
  gem 'listen', '~> 3.0.5'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Access an IRB console on exception pages or
  # by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'email_spec'
  gem 'factory_bot_rails'
  gem 'selenium-webdriver'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
