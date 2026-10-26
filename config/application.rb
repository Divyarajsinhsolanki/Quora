require_relative 'boot'

require 'rails/all'
require "active_model/railtie"
require "active_job/railtie"
require 'csv'
require 'smarter_csv'


# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Quora
  class Application < Rails::Application
    config.active_job.queue_adapter = :sidekiq
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0
    config.generators.javascript_engine = :js
    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    config.action_view.embed_authenticity_token_in_remote_forms = true
    config.autoload_paths += %w[#{config.root}/app/models/ckeditor]
    config.assets_plugins = ['image']

    config.stripe.auto_mount = false
    config.stripe.secret_key = ENV["STRIPE_SECRET_KEY"]
    config.stripe.publishable_key = ENV["STRIPE_PUBLISHABLE_KEY"]

    config.active_storage.variant_processor = :mini_magick
  end
end
