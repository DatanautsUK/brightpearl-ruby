require 'spec_helper'

describe Brightpearl::Service do

  before(:each) do
  end

  it 'wont allow creation of a new object directly' do
    expect { Brightpearl::Service.new }.to raise_error NoMethodError
  end

  context 'when using instance method' do

    let(:s) { Brightpearl::Service.instance }

    it 'will raise an error without a valid config' do
      expect{ s }.to raise_error(Brightpearl::BrightpearlException)
    end

    context 'with a valid config' do

      before do
        Brightpearl.configure(:default) do |config|
          config.datacenter = 'datacenter'
          config.account = "account"
          config.app_ref = "app_ref"
          config.account_token = "account_token"
        end
      end

      it 'will have a configuration' do
        expect(s.configuration).to be_a Brightpearl::Configuration
      end
      
      it 'will generate the correct uri endpoint' do
        expect(s.uri('/test')).to eq "https://datacenter.brightpearl.com/public-api/account/test"
      end
    end

  end

end