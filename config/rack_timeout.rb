Rack::Timeout.service_timeout = 9000  # seconds

# insert middleware wherever you want in the stack, optionally pass initialization arguments
Rails.application.config.middleware.insert_before Rack::Runtime, Rack::Timeout, service_timeout: 900