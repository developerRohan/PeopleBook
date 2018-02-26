source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.1.5'
gem 'sqlite3'
gem 'puma', '~> 3.7'

gem 'uglifier', '>= 1.3.0'
gem 'jquery-ui-rails', '~> 5.0', '>= 5.0.5'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'


group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  gem 'web-console', '>= 3.3.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'simple_form', '~> 3.5', '>= 3.5.1'
gem 'devise', '~> 4.4', '>= 4.4.1'
gem 'net_http_ssl_fix', require: 'net_http_ssl_fix'
gem 'bcrypt', git: 'https://github.com/codahale/bcrypt-ruby.git', :require => 'bcrypt'
gem 'gravatarify', '~> 3.0.0'
gem "gritter", "1.2.0"

gem 'jquery-rails'
gem 'bootstrap-sass', '~> 3.3.7'
gem 'sass-rails', '>= 3.2'