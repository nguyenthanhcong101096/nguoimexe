# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Nguoimexe
  class Application < Rails::Application
    config.autoload_paths += Dir[Rails.root.join('lib')]
    config.session_store :cookie_store, key: 'user_id', domain: :all
    config.active_record.protected_environments = %w[staging]
    config.assets.paths << Rails.root.join('app', 'assets', 'files')
    config.assets.paths << Rails.root.join('node_modules')
    config.assets.precompile += %w[pghero/favicon.png]
    config.assets.enabled = true
    config.assets.gzip = false
    config.assets.css_compressor = :sass
    config.assets.js_compressor = :uglifier
    config.assets.prefix = '/static'
    
    # SMTP settings for gmail
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
      address: 'smtp.gmail.com',
      port: 587,
      user_name: ENV['GMAIL_USER'],
      password: ENV['GMAIL_PASSWORD'],
      authentication: 'plain',
      enable_starttls_auto: true
    }
  end
end
