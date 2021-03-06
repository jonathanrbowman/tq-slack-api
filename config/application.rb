require_relative 'boot'
require 'rails/all'
Bundler.require(*Rails.groups)

module TqSlackApi
  class Application < Rails::Application
    config.load_defaults 5.1
    config.active_job.queue_adapter = :sidekiq

    ENV['SLACK_CLIENT_ID'] = Rails.application.secrets.slack_client_id
    ENV['SLACK_CLIENT_SECRET'] = Rails.application.secrets.slack_client_secret
    ENV['SLACK_VERIFICATION_TOKEN'] = Rails.application.secrets.slack_verification_token
    ENV['SLACK_ACCESS_TOKEN_KEY'] = Rails.application.secrets.access_token_key
    ENV['MAILGUN_API_KEY'] = Rails.application.secrets.mailgun_api_key
  end
end
