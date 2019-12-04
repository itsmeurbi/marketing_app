# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'
require 'resque'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MarketingApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    config.i18n.default_locale = :es
    config.eager_load_paths << Rails.root.join('lib')
    config.time_zone = 'Mexico City'

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.to_prepare do
      Administrate::ApplicationController.helper Application.helpers
    end
  end
end
