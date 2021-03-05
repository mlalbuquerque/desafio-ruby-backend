# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby File.read('.ruby-version').strip

# https://github.com/rails/rails#getting-started
gem 'rails', '~> 6.1.1'
# https://github.com/puma/puma#quick-start
gem 'puma', '~> 5.2', '>= 5.2.1'
# https://github.com/ged/ruby-pg#how-to-install
gem 'pg', '~> 1.2', '>= 1.2.3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 6.0'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.2', '>= 5.2.1'
# Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5.2', '>= 5.2.1'
# https://github.com/Shopify/bootsnap#usage
gem 'bootsnap', '~> 1.4', '>= 1.4.6', require: false
# https://github.com/lucascaton/enumerate_it#using-with-rails
gem 'enumerate_it', '~> 3.2'
# https://github.com/plataformatec/devise#starting-with-rails
gem 'devise', '~> 4.7', '>= 4.7.3'
# https://github.com/plataformatec/simple_form#installation
gem 'simple_form', '~> 5.0', '>= 5.0.2'
# https://github.com/InterageASH/application-query#usage
gem 'interage-query', '~> 0.1.3'
# https://github.com/InterageASH/application-helpers#usage
gem 'interage-helpers', '~> 0.1.1'
# https://github.com/rails-api/active_model_serializers/tree/0-10-stable#installation
gem 'active_model_serializers', '~> 0.10.12'
# https://github.com/kaminari/kaminari#installation
gem 'kaminari', '~> 1.2', '>= 1.2.1'
# https://github.com/amatsuda/active_decorator
gem 'active_decorator', '~> 1.3', '>= 1.3.4'
# https://github.com/nathanvda/cocoon#rails-6webpacker
gem 'cocoon', '~> 1.2', '>= 1.2.15'

group :development, :test do
  # https://github.com/bkeepers/dotenv#rails
  gem 'dotenv-rails', '~> 2.7', '>= 2.7.6'
  # https://github.com/rweng/pry-rails#usage
  gem 'pry-rails', '~> 0.3.9'
  # https://github.com/flyerhzm/bullet
  gem 'bullet', '~> 6.1', '>= 6.1.3'
  # https://github.com/presidentbeef/brakeman
  gem 'brakeman', '~> 5.0', require: false
  # https://github.com/Shopify/erb-lint#installation
  gem 'erb_lint', '~> 0.0.37', require: false
  # https://github.com/rubocop-hq/rubocop-rails#usage
  gem 'rubocop-rails', '~> 2.9', '>= 2.9.1'
  # https://github.com/rubocop-hq/rubocop-performance#usage
  gem 'rubocop-performance', '~> 1.9', '>= 1.9.2'
  # https://github.com/backus/rubocop-rspec
  gem 'rubocop-rspec', '~> 2.2'
  # https://github.com/thoughtbot/factory_bot_rails
  gem 'factory_bot_rails', '~> 6.1'
  # https://github.com/stympy/faker
  gem 'faker', '~> 2.16'
  # https://github.com/bernardo/cpf_faker#ruby-code-
  gem 'cpf_faker', '~> 1.3'
  # https://github.com/sds/scss-lint#usage
  gem 'scss_lint', '~> 0.59.0'
end

group :test do
  # https://github.com/teamcapybara/capybara#setup
  gem 'capybara', '~> 3.32', '>= 3.32.1'
  # https://github.com/rspec/rspec-rails#installation
  gem 'rspec-rails', '~> 4.0'
  # https://github.com/thoughtbot/shoulda-matchers
  gem 'shoulda-matchers', '~> 4.3'
  # https://github.com/DatabaseCleaner/database_cleaner
  gem 'database_cleaner', '~> 1.8', '>= 1.8.4'
  # https://github.com/rails/rails-controller-testing
  gem 'rails-controller-testing', '~> 1.0', '>= 1.0.4'
end

group :development do
  gem 'listen', '~> 3.2', '>= 3.2.1'
  gem 'spring', '~> 2.1'
  gem 'spring-watcher-listen', '~> 2.0', '>= 2.0.1'
end

group :production do
  # https://github.com/aws/aws-sdk-ruby#installation
  gem 'aws-sdk-s3', '~> 1.61', '>= 1.61.1', require: false
end
