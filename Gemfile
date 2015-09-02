source 'https://rubygems.org'

ruby '2.2.3'

gem 'rails', '4.2.4'
gem 'pg'

gem 'uglifier', '>= 1.3.0'

gem 'coffee-rails', '~> 4.1.0'
gem 'haml-rails'
gem 'less-rails'
gem 'twitter-bootstrap-rails'
gem 'angularjs-rails'
gem 'angularjs-rails-resource', '~> 2.0.0'
gem 'jquery-rails'
gem 'execjs'
gem 'therubyracer', platforms: :ruby
gem 'libv8'

gem 'active_model_serializers'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

group :production do
  gem 'rails_12factor'
end

group :development, :test do
  gem 'rspec-rails', '~> 3.0'
  gem 'sqlite3'

  gem 'factory_girl_rails', '~> 4.0'
end

group :development do
  gem 'guard-rubocop'
  gem 'guard-rspec'
  gem 'guard-spring'
  gem 'guard-livereload'
  gem 'rubocop-rspec'

  gem 'thin'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'web-console', '~> 2.0'

  gem 'spring'
  gem 'spring-commands-rspec'
end

group :test do
  gem 'simplecov', require: false
  gem 'codeclimate-test-reporter', require: false
end
