require 'spec_helper'

describe Brightpearl::Service do
  after(:each) do
    Brightpearl.reset!
  end

  it 'wont allow creation of a new object directly' do
    expect { Brightpearl::Service.new }.to raise_error NoMethodError
  end

  context 'when using instance method' do
    it 'will raise an error without a valid config' do
      expect { Brightpearl::Service.instance }.to \
        raise_error(Brightpearl::BrightpearlException)
    end
  end

  context 'with a valid config' do
    let(:service) { Brightpearl::Service.instance }

    before(:each) do
      Brightpearl.configure(:default) do |config|
        config.datacenter = 'datacenter'
        config.account = 'account'
        config.app_ref = 'app_ref'
        config.account_token = 'account_token'
      end
    end

    it 'will have a configuration' do
      expect(service.configuration).to be_a Brightpearl::Configuration
    end

    it 'will generate the correct uri endpoint' do
      expect(service.uri('/test')).to eq 'https://datacenter.brightpearl.com/public-api/account/test'
    end
  end

  context 'when configured for multiple sites' do
    let(:uk) { Brightpearl::Service.instance('uk') }
    let(:eu) { Brightpearl::Service.instance('eu') }
    before(:each) do
      Brightpearl.configure('uk') do |config|
        config.datacenter = 'ws-eu1'
        config.account = 'myuksite'
        config.app_ref = 'app_ref-uk'
        config.account_token = 'account_token-uk'
      end

      Brightpearl.configure('eu') do |config|
        config.datacenter = 'ws-eu'
        config.account = 'myeurosite'
        config.app_ref = 'app_ref-eu'
        config.account_token = 'account_token-eu'
      end
    end

    it 'will not allow use of the :default configuration' do
      expect { Brightpearl::Service.instance }.to \
        raise_error Brightpearl::BrightpearlException
    end

    it 'will generate the correct uri endpoint for each site' do
      expect(uk.uri('/test')).to \
        eq('https://ws-eu1.brightpearl.com/public-api/myuksite/test')

      expect(eu.uri('/test')).to \
        eq('https://ws-eu.brightpearl.com/public-api/myeurosite/test')
    end
  end
end
