require File.expand_path('../boot', __FILE__)

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Final
  class Application < Rails::Application
    config.active_record.raise_in_transactional_callbacks = true

    # config.action_mailer.raise_delivery_errors = true
    # config.action_mailer.delivery_method = :smtp
    # host = 'localhost:3000'
    # config.action_mailer.default_url_options = { host: host }
    # config.action_mailer.smtp_settings = {
    #     address:              'smtp.sendgrid.net',
    #     port:                 587,
    #     domain:               'localhost:3000',
    #     user_name:            'MaxMillington89',
    #     password:             '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',
    #     authentication:       'plain',
    #     enable_starttls_auto: true
    # }

    # ActionMailer::Base.smtp_settings = {
    #     :user_name => 'MaxMillington89',
    #     :password => '0411Mary',
    #     :domain => 'localhost:3000',
    #     :address => 'smtp.sendgrid.net',
    #     :port => 587,
    #     :authentication => :plain,
    #     :enable_starttls_auto => true
    # }
  end
end
