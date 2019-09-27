require File.expand_path('../boot', __FILE__)

require 'rails/all'

require "sprockets/railtie"
# require "rails/test_unit/railtie"
# require 'sprockets/es6'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Agend
  class Application < Rails::Application
    config.assets.precompile << /\.(?:svg|eot|woff|ttf)$/

    config.assets.precompile = ["application.es6"]

    config.generators do |config|
      config.assets = false
      # config.text_framework :rspec
      # config.fixture_replacement :factory_girl
    end

    config.assets.initialize_on_precompile = false
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    config.i18n.default_locale = :en
  end
end
