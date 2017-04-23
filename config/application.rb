require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module CHADHp
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.to_prepare do #devise/sessionを動かした際に、layout/application.html.hamlではなく、layout/devise.haml.hamlを経由してviewに表示される。
      Devise::SessionsController.layout "devise"
      Admin::AdcontactsController.layout "adminApplication"
      Admin::AddashboardController.layout "adminApplication"
      Admin::AdkiseisController.layout "adminApplication"
      Admin::AdusersController.layout "adminApplication"
      Admin::ApplicationController.layout "adminApplication"
    end
    config.time_zone = 'Tokyo'
    config.i18n.default_locale = :ja
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]
    config.assets.initialize_on_precompile = false
  end
end
