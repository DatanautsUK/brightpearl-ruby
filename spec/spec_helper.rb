$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'brightpearl-ruby'

require 'webmock/rspec'
WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |c|
  c.seed = Time.now
end
