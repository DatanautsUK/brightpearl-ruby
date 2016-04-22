require 'spec_helper'

describe Brightpearl do

  it 'has a version number' do
    expect(Brightpearl::VERSION).not_to be nil
  end

  describe Brightpearl::Configuration do

    it 'wont allow creation of a new object directly' do
      expect { Brightpearl::Configuration.new }.to raise_error NoMethodError
    end

    context 'when using instance method' do

      c = Brightpearl::Configuration.instance

      it 'will create an object' do
        expect(c).to be_a(Brightpearl::Configuration)
      end

      it 'wont create a valid configuration' do
        expect(c.valid?).to be false
      end

    end

    context 'when configured from the module' do

      c = Brightpearl.configure {}

      it 'will create a hash of configurations' do
        expect(Brightpearl.configuration).to be_a Hash
      end

      it 'will have a default configuration' do
        expect(Brightpearl.configuration[:default]).to be_a Brightpearl::Configuration
      end

      it 'will return the same object when called directly' do
        expect(Brightpearl::Configuration.instance).to be Brightpearl.configuration[:default]
      end

    end


  end

end
