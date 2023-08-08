require 'rack'
require './time_controller'

ROUTES = {
  '/time' => TimeController.new
}

use Rack::Reloader, 0
use Rack::ContentType, 'text/plain'

run Rack::URLMap.new(ROUTES)
