require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'csv'

# require 'csv'
# require 'iconv'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Hrms
  class Application < Rails::Application
    # config.middleware.use 'Apartment::Elevators::Subdomain'
   
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Asia/Kolkata'

    # config.time_zone = 'Central Time (US & Canada)'

    #config.time_zone = 'Asia/Kolkata'


    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    config.active_job.queue_adapter = :delayed_job
    config.generators do |g|
      g.stylesheets false
      # g.helper false
      g.javascripts false
      # g.test_framework false
    end
  end
end
