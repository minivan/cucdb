require './server'
require 'rack-livereload'

use Rack::LiveReload
run Sinatra::Application