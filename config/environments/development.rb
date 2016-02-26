require 'tls_smtp'
Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = true

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Asset digests allow you to set far-future HTTP expiration dates on all assets,
  # yet still be able to expire them through the digest params.
  config.assets.digest = true

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  # Root url
  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
  #config.domain = 'lvh.me'
  #config.action_mailer.perform_deliveries = true,

  ActionMailer::Base.delivery_method = :smtp

  ActionMailer::Base.smtp_settings = {
    :address => 'smtp.gmail.com',
    :port => 25,
    :domain => 'yourdomain.com',
    :user_name => 'it@indiba.in',
    :password => 'itservice',
    :authentication => :plain
    # :tls => false,
    # :ssl => false
    #:enable_starttls_auto => false,
    #:openssl_verify_mode => 'none'
  }

  # Paperclip setup
  #Paperclip.options[:command_path] = "/usr/local/bin/convert"
  #Paperclip.options[:command_path] = "/home/rk/.rvm/gems/ruby-2.2.2/bin/convert"
end


# ActionMailer::Base.smtp_settings = {
#     :address => 'smtp.bhandarigroup.in',
#     :port => 25,
#     :domain => 'yourdomain.com',
#     :user_name => 'hrmsdws-bhandarigroup',
#     :password => 'hrms1234',
#     :authentication => :plain,
#     #:ssl => true,  
#     #:tls => true,  
#     :enable_starttls_auto => true 
#   }

#SocketError (getaddrinfo: Name or service not known):
#Net::SMTPFatalError (553 5.7.1 <hrmsdws-bhandarigroup>: Sender address rejected: not owned by user hrmsdws-bhandarigroup):
#Net::SMTPAuthenticationError (535 5.7.8 Error: authentication failed: authentication failure
#EOFError (end of file reached):
#Net::SMTPAuthenticationError (530 5.7.0 Must issue a STARTTLS command first. r65sm11167724pfa.27 - gsmtp
#Net::SMTPAuthenticationError (535-5.7.8 Username and Password not accepted. Learn more at
#SocketError (getaddrinfo: Name or service not known):   while address is wrong smtp.

#Net::SMTPAuthenticationError (530 5.7.0 Must issue a STARTTLS command first. 85sm11346951pfl.18 - gsmtp = same code not work on cisco crd

#OpenSSL::SSL::SSLError (SSL_connect returned=1 errno=0 state=unknown state: unknown protocol): = when tls: true
##########################################
# ActionMailer::Base.delivery_method = :smtp

#   ActionMailer::Base.smtp_settings = {
#     :address => 'smtp.gmail.com',
#     :port => 25,
#     :domain => 'yourdomain.com',
#     :user_name => 'erp@indiba.in',
#     :password => 'indibaerp',
#     :authentication => :plain,
#     :enable_starttls_auto => true
#     #:openssl_verify_mode => 'none'
#   }
##########################################3