source 'https://rubygems.org'
gem 'devise'
gem 'geokit-rails'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5.1'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.15'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc


#sabisu is great when application becomes very large, more api endpoints, which causes more complex json
#sabisu is like postman, helps with reading json and sending requests with rails server
#these gems are to decrease learning curve when integrating with other people
gem 'sabisu_rails', github: "IcaliaLabs/sabisu-rails"
#version fixes error with compass-rails and sabisu
gem 'compass-rails', '~> 2.0.4'
gem 'furatto'
gem 'font-awesome-rails'
gem 'simple_form'

gem 'rails_12factor', group: :production

ruby "2.3.0"

group :test do
  gem "rspec-rails", "~> 2.14"
  gem "factory_girl_rails"
  gem 'ffaker'
  gem "shoulda-matchers"
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  #gem 'byebug'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end
