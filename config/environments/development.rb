# require 'tls_smtp'
  Rails.application.configure do
   # Settings specified here will take precedence over those in config/application.rb.
  
   # In the development environment your application's code is reloaded on
   # every request. This slows down response time but is perfect for development
   # since you don't have to restart the web server when you make code changes.
   
   
   config.cache_classes = false
  
   # Do not eager load code on boot.
   config.eager_load = false
  
   # Show full error reports and disable caching.
   config.consider_all_requests_local = false
   config.action_controller.perform_caching = false
  
   # Don't care if the mailer can't send.
   #config.action_mailer.raise_delivery_errors = false
  
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
  
   config.action_mailer.raise_delivery_errors = true
   config.action_mailer.perform_deliveries = true

    
  ### NetCore ###
  # config.action_mailer.default_url_options = { host: 'sm2.netcore.in', port: 993 }
  # # config.domain = 'lvh.me'
  # # config.action_mailer.perform_deliveries = true,
  # ActionMailer::Base.delivery_method = :smtp
  # ActionMailer::Base.smtp_settings = {
  # address: 'sm2.netcore.in',
  # port: 587,
  # domain: 'sm2.netcore.in',
  # user_name: 'hrmsadmin',
  # password: 'Admin@2wsx',
  # authentication: :plain,
  # enable_starttls_auto: true,
  # openssl_verify_mode: OpenSSL::SSL::VERIFY_NONE
  # # openssl_verify_mode: 'none'
  # }

  #config.action_mailer.raise_delivery_errors = true 


  #config.action_mailer.perform_deliveries = true
 
  # Root url
  # config.action_mailer.default_url_options = { host: '192.168.0.62', port: 3000 }
  
   # # config.domain = 'lvh.me'
   # # config.action_mailer.perform_deliveries = true,
   # ActionMailer::Base.delivery_method = :smtp
   # ActionMailer::Base.smtp_settings = {
   # address: 'mail.bhandarigroup.in',
   # port: 587,
   # domain: '192.168.0.62',
   # user_name: 'hrmsdws-bhandarigroup',
   # password: 'hrms1234',
   # authentication: :plain,
   # enable_starttls_auto: true,
   # openssl_verify_mode: OpenSSL::SSL::VERIFY_NONE
   # #openssl_verify_mode: 'none'
   # }

   # config.action_mailer.default_url_options = { host: 'https://mg.mail.yahoo.com', port: 3000}

   # # config.domain = 'lvh.me'
   # # config.action_mailer.perform_deliveries = true,
   # ActionMailer::Base.delivery_method = :smtp
   # ActionMailer::Base.smtp_settings = {
   # address: 'mail.redefine.in',
   # port: 465,
   # domain: 'mail.redefine.in',
   # user_name: 'hrms@redefine.in',
   # password: 'Pass!159',
   # authentication: :plain,
   # enable_starttls_auto: true,
   # openssl_verify_mode: OpenSSL::SSL::VERIFY_NONE
   # # openssl_verify_mode: 'none'
   # }


 # config.action_mailer.default_url_options = { host: 'https://webmail.logix.in/', port: 443}
  
  
 #   # config.domain = 'lvh.me'
 #   # config.action_mailer.perform_deliveries = true,
 #   ActionMailer::Base.delivery_method = :smtp
 #   ActionMailer::Base.smtp_settings = {
 #   address: 'smtp.logix.in',
 #   port: 587,
 #   domain: 'smtp.logix.in',
 #   user_name: 'hrms@sganalytics.com',
 #   password: 'Hrms@2o!7',
 #   authentication: :plain,
 #   enable_starttls_auto: true,
 #   openssl_verify_mode: OpenSSL::SSL::VERIFY_NONE
 #   # openssl_verify_mode: 'none'
 #   }
  
  
   # # config.domain = 'lvh.me'
   # # config.action_mailer.perform_deliveries = true,
   # ActionMailer::Base.delivery_method = :smtp
   # ActionMailer::Base.smtp_settings = {
   # address: 'mail.redefine.in',
   # port: 465,
   # domain: 'mail.redefine.in',
   # user_name: 'hrms@redefine.in',
   # password: 'Pass!159',
   # authentication: :plain,
   # enable_starttls_auto: true,
   # openssl_verify_mode: OpenSSL::SSL::VERIFY_NONE
   # # openssl_verify_mode: 'none'
   # }

   # config.action_mailer.default_url_options = { host: 'https://gmail.com', port: 3000}
  
  
   # # config.domain = 'lvh.me'
   # # config.action_mailer.perform_deliveries = true,
   # ActionMailer::Base.delivery_method = :smtp
   # ActionMailer::Base.smtp_settings = {
   # address: 'mail.indibasolutions.com',
   # port: 465,
   # domain: 'mail.indibasolutions.com',
   # user_name: 'hcmzone@indibasolutions.com',
   # password: 'Indiba04',
   # authentication: :plain,
   # enable_starttls_auto: true,
   # openssl_verify_mode: OpenSSL::SSL::VERIFY_NONE
   # # openssl_verify_mode: 'none'
   # }
  config.action_mailer.default_url_options = { host: 'http://smtp.gmail.com', port: 465 }
  # config.domain = 'lvh.me'
  # config.action_mailer.perform_deliveries = true,
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {

  address: 'smtp.gmail.com',
  port:  25,
  domain: 'smtp.gmail.com',
  user_name: 'hrms@uttamenergy.in',
  password: 'Spool*@#!791',
  authentication: :plain,
  enable_starttls_auto: true,
  openssl_verify_mode: OpenSSL::SSL::VERIFY_NONE
   # openssl_verify_mode: 'none'
  }
  
  #config.action_mailer.default_url_options = { host: 'https://sm2.netcore.in/webmail', port: 993 }
  # config.domain = 'lvh.me'
  # config.action_mailer.perform_deliveries = true,
  #ActionMailer::Base.delivery_method = :smtp
  #ActionMailer::Base.smtp_settings = {
  #address: 'sm2.netcore.in',
  #port: 587,
  #domain: 'sm2.netcore.in',
  #user_name: 'hrmsadmin',
  #password: 'Admin@2wsx',
  #authentication: :plain,
  #enable_starttls_auto: true,
  #openssl_verify_mode: OpenSSL::SSL::VERIFY_NONE
  # openssl_verify_mode: 'none'
  #}


  ################## working #########################
  #config.action_mailer.default_url_options = { host: 'sm2.netcore.in',port:443 }
  # config.domain = 'lvh.me'
  # config.action_mailer.perform_deliveries = true,
  # ActionMailer::Base.delivery_method = :smtp
  # ActionMailer::Base.smtp_settings = {
  # address: 'sm2.netcore.in',
  # port:  587,
  # domain: 'sm2.netcore.in',
  # user_name: 'hrmsadmin@netcore.co.in',
  # password: 'Admin@2wsx',
  # authentication: :plain,
  # enable_starttls_auto: true,
  # openssl_verify_mode: OpenSSL::SSL::VERIFY_NONE
    # openssl_verify_mode: 'none'
  # }

  # config.action_mailer.default_url_options = { host: 'http://amaazia.co.in', port: 2095 }

  # # config.domain = 'lvh.me'
  # # config.action_mailer.perform_deliveries = true,
  # ActionMailer::Base.delivery_method = :smtp
  # ActionMailer::Base.smtp_settings = {
  # address: 'amaazia.co.in',
  # port:  587,
  # domain: 'amaazia.co.in',
  # user_name: 'hrms@rajgreen.co.in',
  # password: 'amaazia@123',
  # authentication: :plain,
  # enable_starttls_auto: true,
  #  openssl_verify_mode: OpenSSL::SSL::VERIFY_NONE
  #  # openssl_verify_mode: 'none'
  # }


   # config.action_mailer.default_url_options = { host: '192.168.0.62', port: 3000 }
  
  
   # # config.domain = 'lvh.me'
   # # config.action_mailer.perform_deliveries = true,
   # ActionMailer::Base.delivery_method = :smtp
   # ActionMailer::Base.smtp_settings = {
   # address: 'mail.bhandarigroup.in',
   # port: 587,
   # domain: '192.168.0.62',
   # user_name: 'hrmsdws-bhandarigroup',
   # password: 'hrms1234',
   # authentication: :plain,
   # enable_starttls_auto: true,
   # openssl_verify_mode: OpenSSL::SSL::VERIFY_NONE
   # #openssl_verify_mode: 'none'
   # }


  # config.action_mailer.default_url_options = { host: 'http://amaazia.co.in', port: 2095 }

  # # config.domain = 'lvh.me'
  # # config.action_mailer.perform_deliveries = true,
  # ActionMailer::Base.delivery_method = :smtp
  # ActionMailer::Base.smtp_settings = {
  # address: 'amaazia.co.in',
  # port:  587,
  # domain: 'amaazia.co.in'
  # user_name: 'hrms@rajgreen.co.in',
  # password: 'amaazia@123',
  # authentication: :plain,
  # enable_starttls_auto: true,
  #  openssl_verify_mode: OpenSSL::SSL::VERIFY_NONE
  #  # openssl_verify_mode: 'none'
  # }


  # config.action_mailer.default_url_options = { host: 'https://webmail.spanpump.com/', port: 443 }
  # # config.domain = 'lvh.me'
  # # config.action_mailer.perform_deliveries = true,
  # ActionMailer::Base.delivery_method = :smtp
  # ActionMailer::Base.smtp_settings = {
  # address: 'smtp.spanpump.com',
  # port:  587,
  # domain: 'smtp.spanpump.com',
  # user_name: 'hrms@spanpump.com',
  # password: 'HRm$@123',
  # authentication: :plain,
  # enable_starttls_auto: true,
  # openssl_verify_mode: OpenSSL::SSL::VERIFY_NONE
  #  # openssl_verify_mode: 'none'
  # }
 
  # # config.domain = 'lvh.me'
  # # config.action_mailer.perform_deliveries = true,
  # ActionMailer::Base.delivery_method = :smtp
  # ActionMailer::Base.smtp_settings = {
  # address: 'amaazia.co.in',
  # port:  587,
  # domain: 'amaazia.co.in'
  # user_name: 'hrms@rajgreen.co.in',
  # password: 'amaazia@123',
  # authentication: :plain,
  # enable_starttls_auto: true,
  #  openssl_verify_mode: OpenSSL::SSL::VERIFY_NONE
  #  # openssl_verify_mode: 'none'
  # }

  # config.action_mailer.default_url_options = { host: 'https://webmail.logix.in/', port: 443 }
 
 
  # # config.domain = 'lvh.me'
  # # config.action_mailer.perform_deliveries = true,
  # ActionMailer::Base.delivery_method = :smtp
  # ActionMailer::Base.smtp_settings = {

  # address: 'smtp.logix.in',
  # port:  587,
  # domain: 'smtp.logix.in',
  # user_name: 'hrms@sganalytics.com',
  # password: 'Hrms@2o!7',
  # authentication: :plain,
  # enable_starttls_auto: true,
  #  openssl_verify_mode: OpenSSL::SSL::VERIFY_NONE
  #  # openssl_verify_mode: 'none'
  # }
  
  # config.action_mailer.default_url_options = { host: 'http://182.71.216.30/webmail', port: 443 }
  # config.domain = 'lvh.me'
  # config.action_mailer.perform_deliveries = true,
  # ActionMailer::Base.delivery_method = :smtp
  # ActionMailer::Base.smtp_settings = {
  # address: '182.71.216.30',
  # port:  587,
  # domain: '182.71.216.30',
  # user_name: 'hrms@sparkline.co.in',
  # password: 'HRMS@2018',
  # authentication: :plain,
  # enable_starttls_auto: true,
  # openssl_verify_mode: OpenSSL::SSL::VERIFY_NONE
  #  # openssl_verify_mode: 'none'
  # }

  # config.action_mailer.delivery_method = :smtp
  # config.action_mailer.smtp_settings = {
  # config.action_mailer.default_url_options = { host: 'smtp.gmail.com', port:  465 }
  # config.domain = 'lvh.me'
  # config.action_mailer.perform_deliveries = true,
  # ActionMailer::Base.delivery_method = :smtp
  # ActionMailer::Base.smtp_settings = {
  # :address => "smtp.gmail.com",
  # :port => 25,
  # :domain => "gmail.com",
  # :user_name => "hrms.netcore@gmail.com",
  # :password => "netcore@123",
  # :authentication => "plain",
  # :enable_starttls_auto => true,
  # openssl_verify_mode: OpenSSL::SSL::VERIFY_NONE
  # }
  
# # Root url
  # config.action_mailer.default_url_options = { host: '192.168.0.62', port: 3000 }
  # ActionMailer::Base.smtp_settings = {
  # :address => "mail.rajgreen.co.in",
  # :port => 25,
  # :user_name => "hrms@rajgreen.co.in",
  # :password => "amaazia@123",
  # :authentication => 'plain',
  # }
   # # Root url
   # config.action_mailer.default_url_options = { host: 'mail.bhandarigroup.in', port: 3000 }
   
   # # config.domain = 'lvh.me'
   # # config.action_mailer.perform_deliveries = true,
   # ActionMailer::Base.delivery_method = :smtp
  
   # ActionMailer::Base.smtp_settings = {
   # address: 'mail.bhandarigroup.in',
   # port: 25,
   # domain: '192.168.0.62',
   # user_name: 'hrmsdws-bhandarigroup',
   # password: 'hrms1234',
   # authentication: :plain,
   # openssl_verify_mode: 'none'
   # }
  
   # Root url
  # config.action_mailer.default_url_options = { host: 'mail.amaazia.co.in', port: 3000 }
  # # config.domain = 'lvh.me'
  # # config.action_mailer.perform_deliveries = true,
  # ActionMailer::Base.delivery_method = :smtp
  
  # ActionMailer::Base.smtp_settings = {
  # :address => "mail.amaazia.co.in",
  # :port => 25,
  # :user_name => "hrms@amaazia.co.in",
  # :password => "ranna@123",
  # :authentication => 'plain',
  # }
  
   # # Root url
   # config.action_mailer.default_url_options = { host: 'imap.gmail.com', port: 3000 }
   # # config.domain = 'lvh.me'
   # # config.action_mailer.perform_deliveries = true,
   # ActionMailer::Base.delivery_method = :smtp
  
   # ActionMailer::Base.smtp_settings = {
   # address: 'smtp.gmail.com',
   # port: 25,
   # domain: 'imap.gmail.com',
   # authentication: :plain,
   # enable_starttls_auto: true,
   # user_name: 'ranna.p@amaazia.com',
   # password: 'rannahr@123'
   # }
  
  # config.action_mailer.default_url_options = { :host => 'amaazia.com', port: 3000 } 
  # config.action_mailer.delivery_method = :smtp 
  # config.action_mailer.perform_deliveries = true 
  # config.action_mailer.raise_delivery_errors = false 
  # config.action_mailer.default :charset => "utf-8" 
  # config.action_mailer.smtp_settings = { 
  # address: "smtp.gmail.com",
  # port: 587,
  # domain: "amaazia.com",
  # authentication: "plain",
  # enable_starttls_auto: true,
  # user_name: ENV["ranna.p@amaazia.com"],
  # password: ENV["rannahr@1234"]




 # Root url
#   config.action_mailer.default_url_options = { host: 'mail.rajgreen.co.in', port: 3000 }
#   # config.domain = 'lvh.me'
#    config.action_mailer.perform_deliveries = true,
#   ActionMailer::Base.delivery_method = :smtp
#   ActionMailer::Base.smtp_settings = {
#     :address => "mail.rajgreen.co.in",
#     :port => 465,
#     :user_name => "hrms@rajgreen.co.in",
#     :password => "amaazia@123",
#     :authentication => 'plain',
# }

#   ActionMailer::Base.smtp_settings = {
#     :address => "mail.rajgreen.co.in",
#     :port => 25,
#     :user_name => "hrms@rajgreen.co.in",
#     :password => "amaazia@123",
#     :authentication => 'plain',
# }


 # # Root url
 #  config.action_mailer.default_url_options = { host: 'mail.bhandarigroup.in', port: 3000 }
 
 #  # config.domain = 'lvh.me'
 #  # config.action_mailer.perform_deliveries = true,
 #  ActionMailer::Base.delivery_method = :smtp

 #  ActionMailer::Base.smtp_settings = {
 #    address: 'mail.bhandarigroup.in',
 #    port: 25,
 #    domain: '192.168.0.62',
 #    user_name: 'hrmsdws-bhandarigroup',
 #    password: 'hrms1234',
 #    authentication: :plain,
 #    openssl_verify_mode: 'none'
 #  }

 # Root url
#   config.action_mailer.default_url_options = { host: 'mail.amaazia.com', port: 3000 }
#   # config.domain = 'lvh.me'
#   # config.action_mailer.perform_deliveries = true,
#   ActionMailer::Base.delivery_method = :smtp

#   ActionMailer::Base.smtp_settings = {
#     :address => "mail.amaazia.com",
#     :port => 465,
#     :user_name => "ranna.p@amaazia.com",
#     :password => "ranna@123",
#     :authentication => 'plain',
# }

 # # Root url
  # config.action_mailer.default_url_options = { host: 'imap.gmail.com', port: 3000 }
  # # config.domain = 'lvh.me'
  # # config.action_mailer.perform_deliveries = true,
  # ActionMailer::Base.delivery_method = :smtp

  # ActionMailer::Base.smtp_settings = {
  #   address: 'smtp.gmail.com',
  #   port: 25,
  #   domain: 'imap.gmail.com',
  #   authentication: :plain,
  #   enable_starttls_auto: true,
  #   user_name: 'ranna.p@amaazia.com',
  #   password: 'rannahr@123'
  # }
 
  
   # Paperclip setup
   # Paperclip.options[:command_path] = "/usr/local/bin/convert"
   # Paperclip.options[:command_path] = "/home/rk/.rvm/gems/ruby-2.2.2/bin/convert"
end
