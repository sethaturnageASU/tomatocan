Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.
config.action_mailer.delivery_method = :smtp
config.action_mailer.raise_delivery_errors = true
config.action_mailer.smtp_settings = {
   :address   => "smtp.gmail.com",
   :port      => 587, # ports 587 and 2525 are also supported with STARTTLS
   :enable_starttls_auto => true, # detects and uses STARTTLS
   :user_name => "crowdpublishtv.star@gmail.com",
   :password  => ENV['GMAIL_PWD'], # SMTP password is any valid API key
   :authentication => 'plain' # Mandrill supports 'plain' or 'login'
#   :domain => 'www.crowdpublish.tv', # your domain to identify your server when connecting
 }
# Force all access to the app over SSL, use Strict-Transport-Security,
  # and use secure cookies.
  config.force_ssl = false  #otherwise heroku reroute will say i'm a liar

  config.action_mailer.default_url_options = { 
    :host => 'http://www.crowdpublish.tv', :protocol => 'http' }

# Force
  # The test environment is used exclusively to run your application's
  # test suite. You never need to work with it otherwise. Remember that
  # your test database is "scratch space" for the test suite and is wiped
  # and recreated between test runs. Don't rely on the data there!
  config.cache_classes = true

  # Do not eager load code on boot. This avoids loading your whole application
  # just for the purpose of running a single test. If you are using a tool that
  # preloads Rails for running tests, you may have to set it to true.
  config.eager_load = false

  # Configure public file server for tests with Cache-Control for performance.
  config.public_file_server.enabled = true
  config.public_file_server.headers = {
    'Cache-Control' => "public, max-age=#{1.hour.seconds.to_i}"
  }

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Raise exceptions instead of rendering exception templates.
  config.action_dispatch.show_exceptions = false

  # Disable request forgery protection in test environment.
  config.action_controller.allow_forgery_protection = false
  config.action_mailer.perform_caching = false

  # Tell Action Mailer not to deliver emails to the real world.
  # The :test delivery method accumulates sent emails in the
  # ActionMailer::Base.deliveries array.
  config.action_mailer.delivery_method = :test

  # Print deprecation notices to the stderr.
  config.active_support.deprecation = :stderr

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true
end
