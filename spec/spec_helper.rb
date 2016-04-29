$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'brightpearl-ruby'

require 'webmock/rspec'
WebMock.disable_net_connect!(allow_localhost: true)

dir = File.expand_path(File.join(File.dirname(__FILE__), 'support'))
Dir[dir + '/**/*.rb'].each { |f| require f }

RSpec.configure do |config|
  config.seed = Time.now
  config.before(:each) do
    stub_request(:any, /.brightpearl.com/).to_rack(FakeBrightpearl)
  end
end
