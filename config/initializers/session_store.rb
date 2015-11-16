# Be sure to restart your server when you modify this file.

#Rails.application.config.session_store :cookie_store, key: '_hrms_session'

Rails.application.config.session_store :cookie_store, {
  key: '_hrms_session',
  domain: Rails.configuration.domain
}
