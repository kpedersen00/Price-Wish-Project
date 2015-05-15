require 'pathname'

APP_ROOT = Pathname.new(File.dirname(File.expand_path(__FILE__)))

#require the ActiveRecord db configuration
require APP_ROOT.join('db', 'config')


#require the app's models
require APP_ROOT.join('app', 'models', 'user')
require APP_ROOT.join('app', 'models', 'offer')
require APP_ROOT.join('app', 'models', 'product')
require APP_ROOT.join('app', 'models', 'vendor')
require APP_ROOT.join('app', 'models', 'wish')

#require the app's controllers
require APP_ROOT.join('app', 'controllers', 'search')
require APP_ROOT.join('app', 'controllers', 'controller')

require 'dotenv'
Dotenv.load

# are other require statements needed to include all your models?

Controller.new
