# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment', __FILE__)
run Rails.application


<<<<<<< HEAD
require "rack-timeout"

# Call as early as possible so rack-timeout runs before all other middleware.
# Setting service_timeout is recommended. If omitted, defaults to 15 seconds.
use Rack::Timeout, service_timeout: 90
=======
>>>>>>> 63e0b3a3a546c0a67d4f799b3bf9ee3ae579c364
