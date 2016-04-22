$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'brightpearl-ruby'

RSpec.configure do |c|
  c.seed = Time.now
end