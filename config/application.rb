require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Digitales
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.secret_key_base = "e9ecf9830195a80967808c300c3a6e3926c0c7661c1de42010362b6169b29a278288fde80f8391f40eac5e5d6b2782c4da980892187d51a128bc49d2e3dda3a7"
    config.credentials = "kdhskfdhsgmrdjmpse,g"
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
