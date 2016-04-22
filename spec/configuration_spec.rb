require 'spec_helper'

describe Brightpearl::Configuration do

  after(:each) do
    Brightpearl.reset!
  end

  it 'wont allow creation of a new object directly' do
    expect { Brightpearl::Configuration.new }.to raise_error NoMethodError
  end

  context 'when using instance method' do

    Brightpearl::Configuration.reset!

    c = Brightpearl::Configuration.instance

    it 'will create an object' do
      expect(c).to be_a(Brightpearl::Configuration)
    end

    it 'wont create a valid configuration' do
      expect(c.valid?).to be false
    end

  end

  context 'when configured from the module' do

    before(:each) do
      Brightpearl::Configuration.reset!
    end

    it 'will create a hash of configurations' do
      expect(Brightpearl.configuration).to be_a Hash
    end

    it 'will have a default configuration' do
      Brightpearl.configure {}
      expect(Brightpearl.configuration[:default]).to be_a Brightpearl::Configuration
    end

    it 'will return the same object when called directly' do
      c = Brightpearl.configure {}
      expect(Brightpearl::Configuration.instance).to be c
    end

  end

end
