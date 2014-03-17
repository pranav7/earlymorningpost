Earlymorningpost::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations
  config.active_record.migration_error = :page_load

  config.fog_credentials = {
  # Configuration for Amazon S3 should be made available through an Environment variable.
  # For local installations, export the env variable through the shell OR
  # if using Passenger, set an Apache environment variable.
  #
  # In Heroku, follow http://devcenter.heroku.com/articles/config-vars
  #
  # $ heroku config:add S3_KEY=your_s3_access_key S3_SECRET=your_s3_secret S3_REGION=eu-west-1 S3_ASSET_URL=http://assets.example.com/ S3_BUCKET_NAME=s3_bucket/folder

  # Configuration for Amazon S3
  :provider              => 'AWS',
  :aws_access_key_id     => ENV['S3_KEY'],
  :aws_secret_access_key => ENV['S3_SECRET']
}

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true
end
