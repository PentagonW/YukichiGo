source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

gem 'webpacker', git: 'https://github.com/rails/webpacker.git'
gem 'uglifier', '>= 1.3.0'
gem 'turbolinks', '~> 5'
gem 'sass-rails', '~> 5.0'
gem 'rails-ujs'
gem 'rails', '~> 5.2.2'
gem 'puma', '~> 3.11'
gem 'rqrcode'
gem 'jbuilder', '~> 2.5'
gem 'haml-rails'
gem 'dotenv-rails'
gem 'coffee-rails', '~> 4.2'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'kaminari'

group :production do
  gem 'pg'
end

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'sqlite3'
  gem "pry-rails"
  gem 'rspec-rails', '~> 3.8'
  gem 'factory_bot_rails'
  gem 'rails-controller-testing'

end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
