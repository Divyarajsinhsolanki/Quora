require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Quora
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

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
    config.stripe.secret_key = 'sk_test_51LI9drSFHL5joWv1wQ1gReOgUbLd9PDwzgzF8gCEvFYeuqolHXxlJs62fDex7IYHrNbPbgNY9GAfZ2jAVzTTwRkD0037VUCxfl'
    config.stripe.publishable_key = 'pk_test_51LI9drSFHL5joWv1wNMMjJoxEMX1wxbJ1MEQiCdZBigcmXBx6P7dzlF5YDMHxnBrY3DoNgbrX8xW6npkVbylCJjz00hNAzunDJ'

    config.active_storage.variant_processor = :mini_magick
  end
end
