# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Rails2
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Allow framing to see output in Repl.it
    config.action_dispatch.default_headers = {
      'X-Frame-Options' => ''
    }
    config.i18n.default_locale = :ru
    config.action_view.field_error_proc = proc do |html_tag, _instance|
      html_tag
    end
    # File: config/application.rb
    config.exceptions_app = routes
  end
end
