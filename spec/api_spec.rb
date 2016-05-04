require 'spec_helper'

describe Brightpearl do
  context 'without a valid token' do
    it 'should get a forbidden response' do
      uri = URI('https://ws-eu1.brightpearl.com/public-api/myaccount/contact-service/contact/200')
      response = HTTParty.get(uri)
      expect(response.code.to_i).to eq 401
    end
  end

  context 'with a valid API token' do
    let(:headers) do
      {
        'Content-Type' => 'application/json',
        'Accept' => 'json',
        'brightpearl-app-ref' => 'myaccount',
        'brightpearl-account-token' => 'myaccount-token'
      }
    end

    it 'can get a contact from Brightpearl' do
      uri = URI('https://ws-eu1.brightpearl.com/public-api/myaccount/contact-service/contact/200')
      request = HTTParty.get(uri, headers: headers)
      expect(request['response'].first['contactId']).to eq 200
    end
  end
end
