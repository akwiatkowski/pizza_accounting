source 'https://rubygems.org'

gem 'rails'
gem 'execjs'
gem 'therubyracer'
gem 'jquery-rails'
gem 'haml'
gem 'haml-rails'
gem 'mocha'
gem 'inherited_resources'
gem 'has_scope'
gem 'responders'
gem 'kaminari'
gem 'simple_form'
gem 'devise'
gem 'cancan'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platform => :ruby

  gem 'uglifier', '>= 1.0.3'
end


group :development do
  gem 'sqlite3'
  gem 'nifty-generators'
  gem 'heroku'
  gem 'pry-rails'

  # webconsole
  gem 'rack-webconsole-pry', :require => 'rack-webconsole'
end

group :production do
  gem 'pg'
end

group :development, :test do
  gem 'rspec-rails', '>= 2.6.1.beta1'
end

group :test do
  gem "mocha"
  gem 'factory_girl' #, ">= 1.1.beta1"
  gem 'capybara', ">= 0.4.1.2"
  gem 'database_cleaner', '>= 0.6.7'
  gem 'spork'
end
