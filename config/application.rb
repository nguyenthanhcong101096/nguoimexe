# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Nguoimexe
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.active_record.protected_environments = %w[staging]
    config.assets.paths << Rails.root.join('app', 'assets', 'files')
    config.assets.paths << Rails.root.join('node_modules')
    config.assets.precompile += %w[pghero/favicon.png]
    config.assets.enabled = true
    config.assets.gzip = false
    config.assets.css_compressor = :sass
    config.assets.js_compressor = :uglifier
    config.assets.prefix = '/static'
  end
end
