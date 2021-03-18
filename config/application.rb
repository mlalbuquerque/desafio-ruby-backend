# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module DesafioImpulso
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    config.generators.system_tests = nil

    # TimeZone
    config.time_zone = 'America/Recife'
    config.active_record.default_timezone = :local

    # Load locales
    config.i18n.enforce_available_locales = true
    config.i18n.available_locales = ['en', 'pt-BR']
    config.i18n.default_locale = 'pt-BR'
    config.encoding = 'utf-8'

    config.i18n.load_path +=
      Dir[Rails.root.join('config/locales/**/*.{rb,yml}').to_s]

    config.generators do |g|
      g.orm :active_record, primary_key_type: :uuid
      g.test_framework :rspec
    end
  end
end
