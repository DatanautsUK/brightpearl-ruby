require 'spec_helper'

describe Brightpearl do
  it 'has a version number' do
    expect(Brightpearl::VERSION).not_to be nil
  end

  it 'can get a contact from Brightpearl' do
    uri = URI('https://ws-eu1.brightpearl.com/public-api/myaccount/contact-service/contact/200')

    response = JSON.load(Net::HTTP.get(uri))['response']
    expect(response.first['contactId']).to eq 200
  end
end
